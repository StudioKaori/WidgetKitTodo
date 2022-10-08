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
      }// END: navigation view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
