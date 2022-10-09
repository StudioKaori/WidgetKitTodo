//
//  WidgetKitTodoWidgetEntryView.swift
//  WidgetKitTodoWidgetExtension
//
//  Created by Kaori Persson on 2022-10-09.
//

import WidgetKit
import SwiftUI

struct WidgetView: View {
  // read the size of widget
  @Environment(\.widgetFamily) var widgetFamily
  
    var entry: Provider.Entry

    var body: some View {
      switch widgetFamily {
      case .systemMedium:
        
      case .systemLarge:
        
      default:
        Text("Not implemented!")
      }
    }
}
