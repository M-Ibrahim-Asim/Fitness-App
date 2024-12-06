//
//  GenderView.swift
//  Fitness
//
//  Created by Apple on 05/12/2024.
//

import SwiftUI

struct GenderView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showNotificationsView: Bool = false
    @State var gender: Int = 0
    
    var body: some View {
        VStack{
            
            header
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120 ,height: 60)
                .padding(.top,-15)
            Spacer()
            
            titleText
            choice
            text
            
            Spacer()
            continueButton
            
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .navigationBarHidden(true)
    }
    
    var header: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack{
                Image(systemName: "chevron.left")
                    .FontForegroundColorModifier(25, .bold, .rounded, .standard, nil, nil, Color("blue"))
                Spacer()
            }
            .padding(.horizontal,15)
        })
    }
    
    var titleText: some View{
        Text("Which one are you?")
            .FontForegroundColorModifier(23, .heavy, .rounded, .standard, nil, nil, .primary)
            .multilineTextAlignment(.center)
            .padding(.horizontal,10)
    }
    
    var choice: some View {
        HStack(spacing: 15){
            
            VStack(spacing: 10){
                
                HStack{
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .FontForegroundColorModifier(20, .regular, .default, .standard, nil, nil, Color("purple"))
                }
                .opacity(gender == 1 ? 1 : 0)
                
                Text("🙋🏼‍♂️")
                    .font(.system(size: 45))
                Text("Male")
                    .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, .primary)
            }
            .padding(20)
            .FrameBackgroundColorModifier(nil, nil, Color("Primary"), 1, 10)
            .onTapGesture {
                withAnimation(.linear){
                    gender = 1
                }
            }
            
            
            VStack(spacing: 10){
                
                HStack{
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .FontForegroundColorModifier(20, .regular, .default, .standard, nil, nil, Color("purple"))
                }
                .opacity(gender == 2 ? 1 : 0)
                
                Text("🙋🏼‍♀️")
                    .font(.system(size: 45))
                Text("Female")
                    .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, .primary)
            }
            .padding(20)
            .FrameBackgroundColorModifier(nil, nil, Color("Primary"), 1, 10)
            .onTapGesture {
                withAnimation(.linear){
                    gender = 2
                }
            }
            
        }
        .padding()
        .padding(.horizontal,40)
    }
    
    var text: some View{
        Text("To give you a better experience we need \n to know your gender")
            .FontForegroundColorModifier(15, .medium, .default, .standard, nil, nil, .secondary)
            .multilineTextAlignment(.center)
            .padding(20)
            .padding(.top,-17)
    }
    
    var continueButton: some View {
        Button(action: {
            showNotificationsView = true
        }, label: {
            Text("Continue")
                .FontForegroundColorModifier(16, .bold, .default, .standard, nil, nil, Color.white)
                .frame(maxWidth: .infinity)
                .FrameBackgroundColorModifier(nil, 45, Color("purple"), 1, 35)
                .padding(.horizontal,50)
        })
        .navigationDestination(isPresented: $showNotificationsView) {
            NotificationsView()
        }
        
    }
}

struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView()
    }
}
