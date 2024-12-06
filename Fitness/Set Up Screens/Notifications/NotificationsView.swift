//
//  NotificationsView.swift
//  Fitness
//
//  Created by Apple on 05/12/2024.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            
            header
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120 ,height: 60)
                .padding(.top,-15)
                .padding(.bottom,15)
            
            titleText
            iphoneLogo
            notificationsReminder
            
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
    
    var titleText: some View{
        Text("Do you want to turn on \n notification?")
            .FontForegroundColorModifier(23, .heavy, .rounded, .standard, nil, nil, .primary)
            .multilineTextAlignment(.center)
            .padding(.horizontal,10)
    }
    
    var iphoneLogo: some View {
        ZStack(alignment: .top){
            Image(systemName: "iphone.gen1")
                .renderingMode(.template)
                .FontForegroundColorModifier(400, .regular, .rounded, .standard, nil, nil, Color("darkBlue"))
                .mask(
                    LinearGradient(
                        gradient: Gradient(colors: [.black,.clear,.clear ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            HStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70 ,height: 35)
                
                VStack(alignment: .leading,spacing: 3) {
                    Text("Momotaro")
                        .FontForegroundColorModifier(14, .bold, .default, .standard, nil, nil, .primary)
                    
                    Text("You have achieved your goal!")
                        .FontForegroundColorModifier(13, .medium, .default, .standard, nil, nil, .secondary)
                }
                
                
            }
            .padding(20)
            .FrameBackgroundColorModifier(nil, nil, Color("Primary"), 1, 10)
            .offset(y:100)
            
        }
        .padding(.bottom,-220)
        .padding(.top,5)
    }
    
    var notificationsReminder: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Image(systemName: "checkmark")
                    .resizable()
                    .FontForegroundColorModifier(20, .semibold, .default, .standard, 17, 12, Color(.systemGray2))
                
                Text("New weekly healthy reminder")
                    .FontForegroundColorModifier(15, .medium, .default, .standard, nil, nil, .primary)
                
            }
//            .frame(maxWidth: .infinity,alignment: .leading)
            
            Rectangle().fill(Color.gray.opacity(0.5))
                .frame(height: 1)
            
            HStack{
                Image(systemName: "checkmark")
                    .resizable()
                    .FontForegroundColorModifier(20, .semibold, .default, .standard, 17, 12, Color(.systemGray2))
                
                Text("Motivational reminder")
                    .FontForegroundColorModifier(15, .medium, .default, .standard, nil, nil, .primary)
                
            }
            
            Rectangle().fill(Color.gray.opacity(0.5))
                .frame(height: 1)
            
            HStack{
                Image(systemName: "checkmark")
                    .resizable()
                    .FontForegroundColorModifier(20, .semibold, .default, .standard, 17, 12, Color(.systemGray2))
                
                Text("Personalised program")
                    .FontForegroundColorModifier(15, .medium, .default, .standard, nil, nil, .primary)
                
            }
            
            
        }
        .padding()
        .padding(.horizontal,20)
    }
    
    var buttons: some View {
        VStack(spacing: 15){
            Button(action: {
            }, label: {
                Text("Continue")
                    .FontForegroundColorModifier(16, .bold, .default, .standard, nil, nil, Color.white)
                    .frame(maxWidth: .infinity)
                    .FrameBackgroundColorModifier(nil, 45, Color("purple"), 1, 35)
                    .padding(.horizontal,50)
            })
//            .navigationDestination(isPresented: $showGenderView) {
//                GenderView()
//            }
            
            Button(action: {
                
            }, label: {
                Text("Not Now")
                    .FontForegroundColorModifier(16, .semibold, .default, .standard, nil, nil, Color("purple"))
            })
            
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
