//
//  HomeScreen1View.swift
//  Fitness
//
//  Created by Apple on 06/12/2024.
//

import SwiftUI

struct HomeScreen1View: View {
    var body: some View {
        VStack{
            
            header
            goodMorningText
            text
            
            VStack(alignment: .leading,spacing: 40) {
                Text("More details")
                    .FontForegroundColorModifier(15, .semibold, .default, .standard, nil, nil, Color("purple"))
                
                VStack(spacing: 20){
                    HStack{
                        
                        Image("pizza")
                            .resizable()
                            .frame(width: 35 ,height: 35)
                        
                        VStack(alignment:.leading,spacing: 8){
                            Text("Nutrition")
                            .FontForegroundColorModifier(15, .semibold, .default, .standard, nil, nil, Color("purple"))
                            
                            Text("300 cal / 1200 cal")
                                .FontForegroundColorModifier(14, .regular, .default, .standard, nil, nil, .secondary)
                        }
                        
                        Spacer()
                        
                        Text("Warning")
                            .padding(.vertical,5)
                            .padding(.horizontal)
                            .FontForegroundColorModifier(14, .regular, .default, .standard, nil, nil, Color("purple"))
                            .FrameBackgroundColorModifier(nil, nil, Color(.systemGray4), 1, 30)
                    }
                    
                    ZStack{
                        HStack(spacing: 0) {
                            ForEach(0..<5) { index in
                                Rectangle()
                                    .foregroundColor(colorOfBar(index))
                                    .frame(height: 8)
                            }
                        }
                        .cornerRadius(15)
                        Rectangle()
                            .FontForegroundColorModifier(20, .ultraLight, .default, .standard, 1.5, 20, .primary)
                            .offset(x:-40)
                    }
                    .padding(.horizontal,20)
                    
                }
                
                VStack(spacing: 20){
                    HStack{
                        
                        Image("water")
                            .resizable()
                            .frame(width: 35 ,height: 35)
                        
                        VStack(alignment:.leading,spacing: 8){
                            Text("Water")
                            .FontForegroundColorModifier(15, .semibold, .default, .standard, nil, nil, Color("purple"))
                            
                            Text("3 / 8 glasses")
                                .FontForegroundColorModifier(14, .regular, .default, .standard, nil, nil, .secondary)
                        }
                        
                        Spacer()
                        
                        Text("On track")
                            .padding(.vertical,5)
                            .padding(.horizontal)
                            .FontForegroundColorModifier(14, .regular, .default, .standard, nil, nil, .orange)
                            .FrameBackgroundColorModifier(nil, nil, Color(.systemGray5), 1, 30)
                    }
                    
                    ZStack{
                        HStack(spacing: 0) {
                            ForEach(0..<5) { index in
                                Rectangle()
                                    .foregroundColor(colorOfBar(index))
                                    .frame(height: 8)
                            }
                        }
                        .cornerRadius(15)
                        Rectangle()
                            .FontForegroundColorModifier(20, .ultraLight, .default, .standard, 1.5, 20, .primary)
                            .offset(x:-40)
                    }
                    .padding(.horizontal,20)
                    
                }
                
                VStack(spacing: 20){
                    HStack{
                        
                        Image("shoe")
                            .resizable()
                            .frame(width: 35 ,height: 35)
                        
                        VStack(alignment:.leading,spacing: 8){
                            Text("Daily Steps")
                            .FontForegroundColorModifier(15, .semibold, .default, .standard, nil, nil, Color("purple"))
                            
                            Text("7,637 / 12,000 steps")
                                .FontForegroundColorModifier(14, .regular, .default, .standard, nil, nil, .secondary)
                        }
                        
                        Spacer()
                        
                        Text("Warning")
                            .padding(.vertical,5)
                            .padding(.horizontal)
                            .FontForegroundColorModifier(14, .regular, .default, .standard, nil, nil, Color("purple"))
                            .FrameBackgroundColorModifier(nil, nil, Color(.systemGray4), 1, 30)
                    }
                    
                    ZStack{
                        HStack(spacing: 0) {
                            ForEach(0..<5) { index in
                                Rectangle()
                                    .foregroundColor(colorOfBar(index))
                                    .frame(height: 8)
                            }
                        }
                        .cornerRadius(15)
                        Rectangle()
                            .FontForegroundColorModifier(20, .ultraLight, .default, .standard, 1.5, 20, .primary)
                            .offset(x:-40)
                    }
                    .padding(.horizontal,20)
                    
                }
                
            }
            .padding(.horizontal,20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
    
    func colorOfBar(_ index: Int) -> Color{
        if index == 3{
            return Color.orange.opacity(0.7)
        }else if index == 4{
            return Color.red.opacity(0.8)
        }else{
            return Color("purple").opacity(1)
        }
    }
    
    var header: some View {
        HStack{
            Button(action: {
                
            }, label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .FontForegroundColorModifier(25, .regular, .default, .standard, 25, 15, .primary)
            })
            
            Spacer()
            
            Image("profileImage")
                .resizable()
                .scaledToFit()
                .FontForegroundColorModifier(30, .regular, .default, .standard, 70, 70, .primary)
        }
        .padding(.horizontal,10)
    }
    
    var goodMorningText: some View {
        HStack{
            Text("Good Morning, \nGrace")
                .FontForegroundColorModifier(27, .heavy, .default, .standard, nil, nil, .primary)
            Spacer()
        }
        .padding(.horizontal,15)
    }
    
    var text: some View {
        Text("Eat the right amount of food and stay hydrated \nthrough the day")
            .FontForegroundColorModifier(16, .medium, .default, .standard, nil, nil, .primary)
            .padding(10)
            .padding(.horizontal,13)
    }
    
}

struct HomeScreen1View_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen1View()
    }
}
