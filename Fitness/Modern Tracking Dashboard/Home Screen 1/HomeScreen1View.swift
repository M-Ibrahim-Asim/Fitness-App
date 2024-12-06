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
            
            
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
    
    var header: some View {
        HStack{
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .FontForegroundColorModifier(25, .regular, .default, .standard, 25, 15, .primary)
            
            Spacer()
            
            Image("profileImage")
                .resizable()
                .scaledToFit()
                .FontForegroundColorModifier(30, .regular, .default, .standard, 70, 70, .primary)
        }
        .padding(.horizontal,10)
    }
    
    
}

struct HomeScreen1View_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen1View()
    }
}
