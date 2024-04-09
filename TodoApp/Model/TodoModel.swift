//
//  TodoModel.swift
//  TodoApp
//
//  Created by kaito on 2024/04/09.
//

import Foundation

struct TodoModel: Identifiable{
    var id = UUID()
    var Tag: String
    var Title: String
    var Details: String
    var Check: Bool
}
