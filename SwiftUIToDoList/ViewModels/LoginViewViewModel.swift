//
//  LoginViewViewModel.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    func fnLogin() {
        
        guard fnValidate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func fnValidate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Fill all the fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Enter valid message"
            return false
        }
        return true
    }
}
