//
//  RegisterViewViewModel.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class RegisterViewViewModel :ObservableObject {
    
    @Published var userName = ""
    @Published var userEmail = ""
    @Published var userPassword = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func fnRegister() {
        guard fnValidate() else {
            return
        }
        
        
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) {[weak self] result, error in
            
            guard let userID = result?.user.uid else {
                return
            }
            self?.fnInsertUserDetail(id: userID)
        }
        
    }
    
    private func fnInsertUserDetail(id:String) {
        let newUser = UserModel(id: id, name: userName, email: userEmail,
                                joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func fnValidate() -> Bool {
        
        errorMessage = ""
        
        guard !userName.trimmingCharacters(in: .whitespaces).isEmpty,
              !userEmail.trimmingCharacters(in: .whitespaces).isEmpty,
              !userPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Enter all the fields"
            return false
        }
        guard userEmail.contains("@") && userEmail.contains(".") else {
            errorMessage = "Enter valid email address"
            return false
        }
        guard !userPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Password cannot empty"
            return false
        }
        guard userPassword.count >= 6 else {
           
            errorMessage = "Password lenth is more than 6 digit"
            return false
        }
        
        return true
    }
}
