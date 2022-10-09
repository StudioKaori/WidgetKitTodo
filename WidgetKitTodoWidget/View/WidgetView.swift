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
        MediumSizeView(entry: entry)
      case .systemLarge:
        LargeSizeView(entry: entry)
      default:
        Text("Not implemented!")
      }
    }
}
