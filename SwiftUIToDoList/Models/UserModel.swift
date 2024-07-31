//
//  UserModel.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import Foundation

struct UserModel:Codable {
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
