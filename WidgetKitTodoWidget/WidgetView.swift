//
//  WidgetKitTodoWidgetEntryView.swift
//  WidgetKitTodoWidgetExtension
//
//  Created by Kaori Persson on 2022-10-09.
//

import WidgetKit
import SwiftUI

struct WidgetView: View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}
