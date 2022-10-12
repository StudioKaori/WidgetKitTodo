//
//  LargeSizeView.swift
//  WidgetKitTodoWidgetExtension
//
//  Created by Kaori Persson on 2022-10-09.
//

import WidgetKit
import SwiftUI

struct LargeSizeView: View {
  var entry: SimpleEntry
  
    var body: some View {
      VStack {
        HStack(spacing: 16) {
          Text("My Todo")
          
          Text(Date.now, format: .dateTime)
          
          Spacer()
        }
        .padding(8)
        .background(.blue)
        .foregroundColor(.white)
        .clipped()
        .shadow(radius: 5) // without clipped modifier, the shadow will be applied to each individual views
        
				ForEach(entry.todos) { todo in
					Link(destination: URL(string: "myapp://todo/\(todo.id)")!) {
						HStack {
							Circle()
								.stroke(lineWidth: 2)
								.frame(width: 30, height: 30)
								.overlay {
									if todo.completed {
										Image(systemName: "checkmark")
									}
								}
							
							Text(todo.title)
							
							Spacer()
						} // END: Hstack
						.padding(.horizontal)
					} // END: Link
          
          Divider()
        }
      }
    }
}
