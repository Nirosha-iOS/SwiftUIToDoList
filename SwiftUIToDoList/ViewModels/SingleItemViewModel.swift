//
//  SingleItemViewModel.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
//for each item

class SingleItemViewModel: ObservableObject {
    
    init() {
        
    }
    
    func fnToggleIsDone(item:ToDoListItemModel) {
        
        var updateItem = item
        updateItem.setDone(!item.isDone)
        
    
        // Get Current user id
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
     
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(updateItem.id)
            .updateData(updateItem.asDictionary())
        
        
    }
}

