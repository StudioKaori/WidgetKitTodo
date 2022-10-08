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
    let urlString = baseURL + endpoint
    guard let url = URL(string: urlString) else {
      throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let decoder = JSONDecoder()
    let result = try decoder.decode(T.self, from: data)
    
    return result
  }
  
  func getAllTodos() async throws -> [Todo] {
    let todos: [Todo] = try await fetch(from: "todos/")
    return todos
  }
}
