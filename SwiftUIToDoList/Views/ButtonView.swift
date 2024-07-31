//
//  ButtonView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 27/07/24.
//

import SwiftUI

struct ButtonView: View {
    var title:String
    var bgColor:Color
    var textColor:Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                Text(title)
                    .foregroundStyle(textColor)
                    .bold()
            }
        }
        .padding(10)
    }
}

#Preview {
    ButtonView(title: "button Title", bgColor: .blue, textColor: .white){
        //action
    }
}
