//
//  UserProfileViewViewModel.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import Foundation
import FirebaseAuth

class UserProfileViewViewModel:ObservableObject {
    
    init() {
        
    }
    func fnLogout(){
        do {
            try Auth.auth().signOut()
        }catch {
            
        }
        
    }
}
