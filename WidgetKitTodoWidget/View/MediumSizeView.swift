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
          
          VStack(alignment: .leading) {
            Text("Todo title")
              .font(.headline)
            
            Text("Completed")
              .font(.subheadline)
          }
          
          Spacer()
        }
        .padding()
        
      } label: {
        Label("My Todos", image: "list.dash")
      }
    }
}
