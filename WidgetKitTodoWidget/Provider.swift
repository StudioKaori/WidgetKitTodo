//
//  Provider.swift
//  WidgetKitTodoWidgetExtension
//
//  Created by Kaori Persson on 2022-10-09.
//

import WidgetKit

struct Provider: TimelineProvider {
  
	// placeholder
    func placeholder(in context: Context) -> SimpleEntry {
			SimpleEntry(date: Date(), todos: [.placeholder(0), .placeholder(1)])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
			Task {
				do {
					let todos = try await TodoService.shared.getAllTodos()
					let entry = SimpleEntry(date: .now, todos: todos)
					
					completion(entry)
				} catch {
					completion(SimpleEntry(date: .now, todos: [.placeholder(0)]))
				}
			}
    }

  func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
