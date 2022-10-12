//
//  WidgetKitTodoWidget.swift
//  WidgetKitTodoWidget
//
//  Created by Kaori Persson on 2022-10-09.
//

import WidgetKit
import SwiftUI

@main
struct WidgetKitTodoWidget: Widget {
    let kind: String = "WidgetKitTodoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .supportedFamilies([.systemLarge])
        .configurationDisplayName("My todos")
        .description("View your latest todo(s).")
    }
}

struct WidgetKitTodoWidget_Previews: PreviewProvider {
    static var previews: some View {
			WidgetView(entry: SimpleEntry(date: Date(), todos: [.placeholder(0), .placeholder(1)]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
