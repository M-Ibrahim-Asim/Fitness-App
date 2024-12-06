//
//  PasswordView.swift
//  Fitness
//
//  Created by Apple on 03/12/2024.
//

import SwiftUI

struct PasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var password: String = ""
    @State private var changeTextField: Bool = false
    @State private var colorValid1: Bool = false
    @State private var colorValid2: Bool = false
    @State private var colorValid3: Bool = false
    @State private var validationComplete1: Bool = false
    @State private var validationComplete2: Bool = false
    @State private var validationComplete3: Bool = false
    @State var showProfilePictureView: Bool = false

    
    var body: some View {
        VStack{
            
            header
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120 ,height: 60)
                .padding(.top,-15)
            
            Spacer()
            text
            passwordTextField
            validationChecked
            Spacer()
            button
            
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
    
    var text: some View{
        Text("Now let's set your password")
            .FontForegroundColorModifier(23, .heavy, .rounded, .standard, nil, nil, .primary)
            .multilineTextAlignment(.center)
            .padding(.horizontal,10)
    }
    
    var passwordTextField: some View {
        HStack{
            
            if changeTextField{
                TextField("Password", text: $password)
                    .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, .primary)
            }else{
                SecureField("Password", text: $password)
                    .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, .primary)
            }
            
            Button(action: {
                changeTextField.toggle()
            }, label: {
                Image(systemName: changeTextField ? "eye.slash.fill" : "eye.fill")
                    .FontForegroundColorModifier(20, .regular, .default, .standard, nil, nil, Color("purple"))
            })
        }
        .padding()
        .FrameBackgroundColorModifier(nil, nil, Color("Primary"), 1, 13)
        .padding(.vertical,10)
        .padding(.horizontal,20)
        .shadow(radius: 5,x: 2,y: 2)
        .onChange(of: password) { newValue in
            if newValue.count >= 8 {
                colorValid1 = true
                validationComplete1 = true
            }else{
                colorValid1 = false
                validationComplete1 = false
            }
            
            if newValue.contains(where: {$0.isUppercase}){
                colorValid2 = true
                validationComplete2 = true
            }else{
                colorValid2 = false
                validationComplete2 = false
            }
            
            if newValue.contains(where: { $0.isSymbol || $0.isPunctuation || "!@#$%^&*()_+=<>?/".contains($0) }){
                colorValid3 = true
                validationComplete3 = true
            }else{
                colorValid3 = false
                validationComplete3 = false
            }
        }
    }
    
    var validationChecked: some View {
        VStack(alignment: .leading,spacing: 15){
            
            HStack(spacing: 15){
                RoundedRectangle(cornerRadius: 3)
                    .FontForegroundColorModifier(16, .regular, .rounded, .standard, 16, 16, colorValid1 ? Color("purple") :  .gray)
                
                Text("8+ character")
                    .FontForegroundColorModifier(16, .regular, .rounded, .standard, nil, nil, .secondary)
            }
            
            HStack(spacing: 15){
                RoundedRectangle(cornerRadius: 3)
                    .FontForegroundColorModifier(16, .regular, .rounded, .standard, 16, 16, colorValid2 ? Color("purple") :  .gray)
                
                Text("At least 1 uppercase")
                    .FontForegroundColorModifier(16, .regular, .rounded, .standard, nil, nil, .secondary)
            }
            
            HStack(spacing: 15){
                RoundedRectangle(cornerRadius: 3)
                    .FontForegroundColorModifier(16, .regular, .rounded, .standard, 16, 16, colorValid3 ? Color("purple") :  .gray)
                
                Text("At least 1 symbol")
                    .FontForegroundColorModifier(16, .regular, .rounded, .standard, nil, nil, .secondary)
            }
            
        }
        .frame(maxWidth: .infinity ,alignment: .leading)
        .padding(.horizontal,20)
        .padding(.vertical,10)
    }
    
    var button: some View {
        Button(action: {
            if validationComplete1 && validationComplete2 && validationComplete3{
                showProfilePictureView.toggle()
            }
        }, label: {
            Text("Continue")
                .FontForegroundColorModifier(16, .bold, .default, .standard, nil, nil, Color.white)
                .frame(maxWidth: .infinity)
                .FrameBackgroundColorModifier(nil, 45, Color("purple"), 1, 35)
                .padding(.horizontal,50)
        })
        .navigationDestination(isPresented: $showProfilePictureView) {
            ProfilePictureView()
        }
        
    }
    
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}
