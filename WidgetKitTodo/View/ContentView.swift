//
//  ContentView.swift
//  WidgetKitTodo
//
//  Created by Kaori Persson on 2022-10-08.
//

import SwiftUI

struct ContentView: View {
	@State var todos: [Todo] = []
	@State var selectedTodo: Todo?
	
	var body: some View {
		NavigationView {
			List(todos) { todo in
				Button {
					selectedTodo = todo
				} label: {
					Text("\(todo.title): **\(todo.completed ? "completed" : "open")**")
				}
				.buttonStyle(.plain)
			}// END: List
			.navigationTitle("My Todos")
			.task {
				do {
					todos = try await TodoService.shared.getAllTodos()
				} catch {
					print(error)
				}
			}
			.sheet(item: $selectedTodo) { todo in
				GroupBox {
					VStack(alignment: .leading) {
						Text(todo.title)
							.font(.headline)
						
						Text(todo.completed ? "Completed" : "Open")
							.font(.subheadline)
					}
				} label: {
					Label("Todo #\(todo.id)", systemImage: "person")
				}
				.padding()
				
			} // END: List
			// it's called only when the app is called through the widget
			.onOpenURL { url in
				guard
					url.scheme == "myapp",
					url.host == "todo",
					let id = Int(url.pathComponents[1])
				else {
					print("issue")
					return
				}
				
				// for async task, use Task
				Task {
					do {
						let todo = try await TodoService.shared.getTodo(with: id)
						// Update the ui in the main thread with DispatchQueue
						DispatchQueue.main.async {
							// To show the individual todo sheet, just set selectedTodo
							selectedTodo = todo
						}
					} catch {
						// todo handle the error
						print(error)
					}
					
				} // END: Task
				
			}
		}// END: navigation view
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
