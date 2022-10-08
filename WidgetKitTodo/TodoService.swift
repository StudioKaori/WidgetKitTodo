//
//  TodoService.swift
//  WidgetKitTodo
//
//  Created by Kaori Persson on 2022-10-08.
//

import Foundation

final class TodoService {
  static let shared = TodoService()
  
  private let baseURL = "https://jsonplaceholder.typicode.com/"
  
  private func fetch<T: Decodable>(from endpoint: String) async throws -> T {
    
  }
}
