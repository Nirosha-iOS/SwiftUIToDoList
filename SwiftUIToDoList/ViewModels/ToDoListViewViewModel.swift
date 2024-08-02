//
//  ToDoListViewViewModel.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import Foundation
import FirebaseFirestore
// primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private var userID: String
    init(userID:String) {
        self.userID = userID
    }
    
    func fnDeleteItem(id:String) {
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
