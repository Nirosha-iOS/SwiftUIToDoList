//
//  SingleItemView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI

struct SingleItemView: View {
    let item:ToDoListItemModel
   @StateObject var viewModel = SingleItemViewModel()
    @State var changeFirmation = false
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .bold()
                    .font(.title2)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.leading,5)
            }
            Spacer()
            
            Button{
                if(!item.isDone){
                    changeFirmation = true
                }else {
                    viewModel.fnToggleIsDone(item:item)
                }
                
            }label: {
                Image(systemName: item.isDone ? 
                      "checkmark.circle.fill":"circle")
                .foregroundColor(.blue)
            }
            .confirmationDialog("Are you sure?",
              isPresented: $changeFirmation) {
                Button("Yes, Finished") {
                    viewModel.fnToggleIsDone(item:item)
                }
            }
            
            
            
        }
        .padding(10)
    }
}

#Preview {
    SingleItemView(item: .init(id: "gfgdgf", title: "testing", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
