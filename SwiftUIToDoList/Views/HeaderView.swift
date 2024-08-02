//
//  HeaderView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 27/07/24.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitle:String
    let angle1:Double
    let angle2:Double
    let bgColor1:Color
    let bgColor2:Color
    let viewHeight:CGFloat
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bgColor1.opacity(1))
                .rotationEffect(Angle(degrees: angle1))
            
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(bgColor2.opacity(0.5))
                    .rotationEffect(Angle(degrees: -angle2))
                    
                   
                VStack {
                    Text(title)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        

                    Text(subtitle)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 30)
            }
            .frame(width: UIScreen.main.bounds.width*4, height: viewHeight)
            .offset(y:0)
        }
        .frame(width:UIScreen.main.bounds.width*4, height: 300)
        .offset(y:-100)
        
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle1: 15, angle2: 15, bgColor1: Color.yellow, bgColor2: Color.green, viewHeight: 300)
}
