//
//  OnboardingScreensView.swift
//  Fitness
//
//  Created by Apple on 02/12/2024.
//

import SwiftUI

struct OnboardingScreensView: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120 ,height: 60)
                
                titleAndText
                
                imageTabView
                
                carousel
                
                getStartedButton
                
                textAndButton
                
            }
            .frame(maxWidth: .infinity ,maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
        }
    }
    
    var titleAndText: some View {
        VStack{
            Text(title())
                .FontForegroundColorModifier(23, .heavy, .rounded, .standard, nil, nil, .primary)
                .multilineTextAlignment(.center)
                .animation(.interactiveSpring())
    //                    .kerning(3)
    //                    .minimumScaleFactor(0.1)
                .padding(.horizontal,10)
                .padding(.vertical,7)
            
            Text(text())
                .FontForegroundColorModifier(16, .medium, .default, .standard, nil, nil, .secondary)
                .multilineTextAlignment(.center)
                .animation(.interactiveSpring())
                .padding(1)
        }
    }
    
    var imageTabView: some View {
        TabView(selection: $selectedIndex) {
            
            ImageView(image: "image1")
                .tag(0)
            
            ImageView(image: "image2")
                .tag(1)
            
            ImageView(image: "image3")
                .tag(2)
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

    }
    
    var carousel: some View {
        HStack(spacing: 8) {
            ForEach(0..<3){ index in
                Circle()
                    .fill(selectedIndex == index ? Color("purple") : .secondary)
                    .frame(width: 8 ,height: 8)
            }
        }
    }
    
    var getStartedButton: some View {
        
        NavigationLink(destination: {
            SignUpView()
        }, label: {
            Text("Get Started")
                .FontForegroundColorModifier(16, .bold, .default, .standard, nil, nil, Color.white)
                .frame(maxWidth: .infinity)
                .FrameBackgroundColorModifier(nil, 45, Color("purple"), 1, 35)
                .padding(.horizontal,40)
        })
        .padding(.top,15)
        .padding(.bottom,8)
    }
    
    var textAndButton: some View {
        HStack{
            
            Text("Already have an account?")
                .FontForegroundColorModifier(16, .medium, .default, .standard, nil, nil, .gray)
            
            Button(action: {
                
            }, label: {
                Text("Sign in")
                    .FontForegroundColorModifier(16, .semibold, .default, .standard, nil, nil, Color("purple"))
            })
            
        }
        .padding(.bottom,15)
    }
    
    func title() -> String{
        if selectedIndex == 0{
            return "Welcome to Momotaro UI Kit"
        }else if selectedIndex == 1{
            return "Training together, more fun"
        }
        else if selectedIndex == 2{
            return "Effortlessly Track & Measure \n Data"
        }
        return ""
    }
    
    func text() -> String{
        if selectedIndex == 0{
            return "The best UI Kit for your next health and fitness \n project!"
        }else if selectedIndex == 1{
            return "You can train your friends,family together."
        }
        else if selectedIndex == 2{
            return "Easy-to-see training plan at your fingertips."
        }
        return ""
    }
    
}

struct OnboardingScreensView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreensView()
    }
}

struct ImageView: View {
    
    @State var image: String
    
    var body: some View{
        
        Image("\(image)")
            .resizable()
            .scaledToFit()
            .frame(width: 350 ,height: 260)
        
    }
    
}
