//
//  customViewModeifiers.swift
//  Fitness
//
//  Created by Apple on 02/12/2024.
//

import Foundation
import SwiftUI


// Custom View Modifier

struct FontForegroundColorModifier: ViewModifier{
   
    var fontSize: CGFloat?
    var fontWeight: Font.Weight?
    var fontDesign: Font.Design?
    var fontWidth:  Font.Width?
    var width: CGFloat?
    var height: CGFloat?
    var foregroundColor: Color?
    
    func body(content: Content) -> some View {
        content
            .font(.system(size:fontSize ?? 100))
            .fontWeight(fontWeight)
            .fontDesign(fontDesign)
            .fontWidth(fontWidth)
            .frame(width: width ,height: height)
            .foregroundColor(foregroundColor)
    }
    
}
struct FrameBackgroundColorModifier: ViewModifier{
   
    var width: CGFloat?
    var height: CGFloat?
    var backgroundColor: Color?
    var opacity: Double?
    var cornerRadius: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .frame(width: width ,height: height)
            .background(backgroundColor?.opacity(opacity ?? 1))
            .cornerRadius(cornerRadius ?? 0)
    }
    
}

extension View{
    
    func FontForegroundColorModifier(_ fontSize: CGFloat? ,_ fontWeight: Font.Weight? , _ fontDesign: Font.Design?, _ fontWidth:  Font.Width? ,_ width: CGFloat? ,_ height: CGFloat? ,_ foregroundColor: Color?) -> some View {
        self.modifier(Fitness.FontForegroundColorModifier(fontSize: fontSize ,fontWeight: fontWeight ,fontDesign: fontDesign ,fontWidth: fontWidth , width: width ,height: height, foregroundColor: foregroundColor))
    }
    
    func FrameBackgroundColorModifier(_ width: CGFloat? ,_ height: CGFloat? ,_ backgroundColor: Color? ,_ opacity: Double? ,_ cornerRadius: CGFloat?) -> some View {
        self.modifier(Fitness.FrameBackgroundColorModifier(width: width ,height: height ,backgroundColor: backgroundColor ,opacity: opacity ,cornerRadius: cornerRadius))
    }
    
}
