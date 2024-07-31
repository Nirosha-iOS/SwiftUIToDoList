//
//  UserProfileView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel = UserProfileViewViewModel()

    var body: some View {
        
        NavigationView{
            VStack{
                Spacer()
                VStack{
                    Spacer()
                    ButtonView(title: "Logout", bgColor: .black, textColor: .white, action: viewModel.fnLogout)
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .padding(50)
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    UserProfileView()
}
