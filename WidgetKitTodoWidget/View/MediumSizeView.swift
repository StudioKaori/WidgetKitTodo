//
//  MediumSizeView.swift
//  WidgetKitTodoWidgetExtension
//
//  Created by Kaori Persson on 2022-10-09.
//

import WidgetKit
import SwiftUI

struct MediumSizeView: View {
  var entry: SimpleEntry
  
    var body: some View {
      GroupBox {
        HStack {
          Image(systemName: "person")
            .resizable()
            .scaledToFit()
            .foregroundColor(.secondary)
          
          Divider()
          
					if let todo = entry.todos.first {
						VStack(alignment: .leading) {
							Text(todo.title)
								.font(.headline)
							
							Text(todo.completed ? "Completed" : "Open")
								.font(.subheadline)
						}
					}
          
          Spacer()
        }
        .padding()
        
      } label: {
        Label("My Todos", systemImage: "list.dash")
      }
			.widgetURL(URL(string: "myapp://todo/\(entry.todo.first?.id ?? 0)"))
    }
}
