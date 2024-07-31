//
//  ToDoListItemModel.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import Foundation

struct ToDoListItemModel: Codable, Identifiable {
    let id:String
    let title:String
    let dueDate:TimeInterval
    let createdDate:TimeInterval
    var isDone:Bool
   
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
