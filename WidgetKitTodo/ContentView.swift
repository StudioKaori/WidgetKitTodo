//
//  ContentView.swift
//  WidgetKitTodo
//
//  Created by Kaori Persson on 2022-10-08.
//

import SwiftUI

struct ContentView: View {
  @State var todos
    var body: some View {
      NavigationSplitView {
        List
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
