//
//  RegisterView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
      
       
            VStack{

                
                HeaderView(title: "Register", subtitle: "Create your Schedule to be done", angle: 15, bgColor1: .yellow, bgColor2: .green)
                    .offset(y:-75)
                Form{
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Username",text:$viewModel.userName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email Id", text: $viewModel.userEmail)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.userPassword)
                        .textFieldStyle(DefaultTextFieldStyle())
                   
                    
                    ButtonView(title: "Register", bgColor: .black, textColor: .white) {
                        viewModel.fnRegister()
                    }

                }
               
               
                
                Spacer()
                
            }
        }
}

#Preview {
    RegisterView()
}
