//
//  NewItemViewViewModel.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var datepicker = Date()
    @Published var showAlert = false
    init() {
        
    }
    
    func fnSave() {
       
        guard canSave else {
            return
        }
        
        // Get Current user id
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create model
        let newID = UUID().uuidString
        let newItem = ToDoListItemModel(
            id: newID,
            title: title,
            dueDate: datepicker.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        //Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
       
        return true
    }
}
