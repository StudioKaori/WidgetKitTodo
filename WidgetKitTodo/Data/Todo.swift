//
//  Todo.swift
//  WidgetKitTodo
//
//  Created by Kaori Persson on 2022-10-08.
//

import Foundation

struct Todo: Decodable, Identifiable {
  let userId: Int
  let id: Int
  let title: String
  let completed: Bool
}

extension Todo {
	static func placeholder(_ id: Int) -> Todo {
		Todo(userId: 0, id: id, title: "Placeholder", completed: .random())
	}
}
