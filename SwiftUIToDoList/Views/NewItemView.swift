//
//  NewItemView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newiItemPresented: Bool
    var body: some View {
        VStack {
            Text("Add your new task")
                .font(.system(size: 25))
                .bold()
                .padding(10)
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due date
                
                DatePicker("Due Date", selection: $viewModel.datepicker,in: Date()...)
                    
                    .datePickerStyle(GraphicalDatePickerStyle())
                    
                
                //button
                
                ButtonView(
                    title: "Add Task",
                    bgColor: .pink,
                    textColor: .white) {
                        if viewModel.canSave {
                            
                            viewModel.fnSave()
                            newiItemPresented = false
                            
                        } else {
                            viewModel.showAlert = true
                        }
                    
                }
                    .padding()
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error Message"), message: Text("Enter all the details"))
            }
        }
    }
}

#Preview {
    NewItemView( newiItemPresented: Binding(get: {
        return true
    }, set: {_ in 
        
    }))
}
