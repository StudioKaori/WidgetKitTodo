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
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetKitTodoWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
