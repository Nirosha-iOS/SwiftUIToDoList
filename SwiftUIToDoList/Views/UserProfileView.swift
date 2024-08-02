//
//  UserProfileView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel = UserProfileViewViewModel()
    @State var islogout = false
    var body: some View {
        
        NavigationView{
            VStack{
             
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                        .padding(10)
                    
                
                if let user = viewModel.user{
                    userProfile(user: user)
                }else {
                   
                    Text("Data Loading......")
                        .padding(.top,20)
                }
                Spacer()
                
                Button{
                    islogout = true
                }label: {
                    Text("Logout")
                        .frame(width:UIScreen.main.bounds.width-30, height: 40)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 20))
                }
                
                .background(.blue)
                .cornerRadius(10)
                .confirmationDialog("Are you sure?", isPresented: $islogout){
                        
                          Button("Yes, Logout") {
                              viewModel.fnLogout()
                          }
                      
                    }
                .padding(.bottom, 50)
                    
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

@ViewBuilder func userProfile(user:UserModel) -> some View {
    VStack (alignment: .leading){
        HStack{
            Text("Name: ")
                .bold()
            Text(user.name)
        }
        .padding(5)
        HStack(){
            Text("Email: ")
                .bold()
            Text(user.email)
        }
        .padding(5)
        HStack{
            Text("Member Since: ")
                .bold()
            Text("\( Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
        }
        .padding(5)
        
       
        
        
    }
    
}
#Preview {
    UserProfileView()
}
