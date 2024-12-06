//
//  ProfilePictureView.swift
//  Fitness
//
//  Created by Apple on 05/12/2024.
//

import SwiftUI

struct ProfilePictureView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var facesDataList: [String] = ["😺","👻","🐵","🐸","🤡","☠️","🎃","💩","🤖","👽","😈","👾"]
    @State var showFingerprintView: Bool = false
    private let itemSize: CGFloat = 80
    private let spacing: CGFloat = 20
    
    var body: some View {
        VStack{
            
            header
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120 ,height: 60)
                .padding(.top,-15)
            Spacer()
            
            selectProfleImage
            
            title
            text
            addCustomPhoto
            
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
    
    var selectProfleImage: some View {
        VStack(spacing: 10){
            
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .FontForegroundColorModifier(15, .bold, .rounded, .standard, 15, 10, Color(.systemGray4))
                .padding(.horizontal,10)
            
            ScrollView(.horizontal){
                HStack(spacing: 15) {
                    ForEach(facesDataList,id: \.self) { face in
                        Text(face)
                            .padding(20)
                            .font(.system(size: 30))
                            .FrameBackgroundColorModifier(nil, nil, Color("Primary"), 1, 50)
                        
                    }
                }
                .padding(.horizontal,160)
            }
            .scrollIndicators(.hidden)
            
            Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .FontForegroundColorModifier(15, .bold, .rounded, .standard, 15, 10, Color(.systemGray4))
                .padding(.horizontal,10)
            
            
        }
        .padding(.vertical)
    }
    
    
    
    var title: some View{
        Text("Profile Picture")
            .FontForegroundColorModifier(23, .heavy, .rounded, .standard, nil, nil, .primary)
            .multilineTextAlignment(.center)
            .padding(.horizontal,10)
    }
    
    var text: some View{
        Text("You can select photo from one of this emoji or add your own photo as profile picture")
            .FontForegroundColorModifier(15, .medium, .default, .standard, nil, nil, .secondary)
            .multilineTextAlignment(.center)
            .padding(15)
            .padding(.top,-17)
    }
    
    var addCustomPhoto: some View {
        Button(action: {
            
        }, label: {
            Text("Add Custom Photo")
                .FontForegroundColorModifier(15, .bold, .default, .standard, nil, nil, Color("purple"))
        })
    }
    
    var continueButton: some View {
        Button(action: {
            showFingerprintView = true
        }, label: {
            Text("Continue")
                .FontForegroundColorModifier(16, .bold, .default, .standard, nil, nil, Color.white)
                .frame(maxWidth: .infinity)
                .FrameBackgroundColorModifier(nil, 45, Color("purple"), 1, 35)
                .padding(.horizontal,50)
        })
        .navigationDestination(isPresented: $showFingerprintView) {
            FingerprintView()
        }
        
    }
    
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView()
    }
}
