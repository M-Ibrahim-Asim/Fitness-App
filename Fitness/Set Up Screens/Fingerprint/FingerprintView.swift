//
//  FingerprintView.swift
//  Fitness
//
//  Created by Apple on 05/12/2024.
//

import SwiftUI

struct FingerprintView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showGenderView: Bool = false
    
    var body: some View {
        VStack{
            
            header
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120 ,height: 60)
                .padding(.top,-15)
            Spacer()
            
            Image("fingetprint")
                .resizable()
                .frame(width: 130 ,height: 130)
                .scaledToFit()
            
            title
            text
            
            Spacer()
            buttons
            
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
    
    var title: some View{
        Text("Enable Fingerprint")
            .FontForegroundColorModifier(23, .heavy, .rounded, .standard, nil, nil, .primary)
            .multilineTextAlignment(.center)
            .padding(.horizontal,10)
    }
    
    var text: some View{
        Text("If you enable touch ID, you don't need to enter your password when you login.")
            .FontForegroundColorModifier(15, .medium, .default, .standard, nil, nil, .secondary)
            .multilineTextAlignment(.center)
            .padding(15)
            .padding(.top,-17)
    }
    
    var buttons: some View {
        VStack(spacing: 15){
            Button(action: {
                showGenderView = true
            }, label: {
                Text("Continue")
                    .FontForegroundColorModifier(16, .bold, .default, .standard, nil, nil, Color.white)
                    .frame(maxWidth: .infinity)
                    .FrameBackgroundColorModifier(nil, 45, Color("purple"), 1, 35)
                    .padding(.horizontal,50)
            })
            .navigationDestination(isPresented: $showGenderView) {
                GenderView()
            }
            
            Button(action: {
                
            }, label: {
                Text("Not Now")
                    .FontForegroundColorModifier(16, .semibold, .default, .standard, nil, nil, Color("purple"))
            })
            
        }
    }
    
}

struct FingerprintView_Previews: PreviewProvider {
    static var previews: some View {
        FingerprintView()
    }
}
