//
//  UserProfileViewViewModel.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserProfileViewViewModel:ObservableObject {
    
    @Published var user:UserModel? = nil
    @Published var logOut = false
    
    init() {
        
    }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId).getDocument {[weak self] userData, error in
                guard let data = userData?.data(), error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = UserModel(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["id"] as? TimeInterval ?? 0
                    )
                }
            }
    }
    
    func fnLogout(){
        do {
            try Auth.auth().signOut()
        }catch {
            print(error)
        }
        
    }
}
