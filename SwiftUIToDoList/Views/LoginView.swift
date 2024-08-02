//
//  LoginView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI

struct LoginView: View {
    
@StateObject var viewModel = LoginViewViewModel()
    var body: some View {
       
        
        NavigationView{
            VStack{
                //header
                HeaderView(title: "My ToDoList", subtitle: "Schedule the task", angle1: 15, angle2: 15, bgColor1: .purple, bgColor2: .blue, viewHeight: 250)
               
                //login
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    ButtonView(title: "Login", bgColor: .blue, textColor: .white) {
                        viewModel.fnLogin()
                    }
                    
                }
               
                
              
                //create profile account
                
                VStack{
                    Text("New to here?")
                  
                    NavigationLink("Create an Account", destination: RegisterView())
                   
                   
                }
                .padding(.bottom, 30)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
