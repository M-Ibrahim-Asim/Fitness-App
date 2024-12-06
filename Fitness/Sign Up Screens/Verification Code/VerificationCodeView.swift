//
//  VerificationCodeView.swift
//  Fitness
//
//  Created by Apple on 03/12/2024.
//

import SwiftUI

struct VerificationCodeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var codeDigits: [String] = Array(repeating: "", count: 5)
    @FocusState private var focuse: Int?
    @State var showPasswordView: Bool = false
//    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timer: Timer?
    @State private var time: Int = 5
    
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
            
            codeTextFields
            
            didnotRecive
            
            Spacer()
            
            continueButton
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .navigationBarHidden(true)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.focuse = 0
                startTimer()
            }
        }
//        .onReceive(timer) { _ in
//            updateTime()
//        }
    }
    
    func startTimer(){
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            if time > 0 {
                time -= 1
                print("Task executed: \(time) times")
                
            } else {
                timer?.invalidate()
                timer = nil
            }
        }
        
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
    
    var text: some View {
        Text("We sent you a code to verify \n your number")
            .FontForegroundColorModifier(23, .heavy, .rounded, .standard, nil, nil, .primary)
            .multilineTextAlignment(.center)
            .padding(.horizontal,10)
    }
    
    var codeTextFields: some View {
        HStack(alignment: .center, spacing: 10) {
            ForEach(0..<5) { index in
                TextField("", text: $codeDigits[index])
//                    .keyboardType(.numberPad)
                    .font(.title2)
                    .offset(x:5)
                    .padding()
                    .FrameBackgroundColorModifier(nil, nil, Color("Primary"), 1, 13)
                    .shadow(radius: 5,x: 2,y: 2)
                    .focused($focuse, equals: index)
                    .onChange(of: codeDigits[index]) { newValue in
                        
                        codeDigits[index] = codeDigits[index].filter{$0.isWholeNumber}
                        
                        if newValue.contains(where: {$0.isWholeNumber}) {
                            focuse = index + 1
                        }else if !newValue.contains(where: {$0.isWholeNumber}){
                            focuse = index - 1
                        }
                        
                        if newValue.count > 1 {
                            codeDigits[index] = String(newValue.prefix(1))
                        }
                        
                    }
            }
        }
        .padding(.horizontal,20)
        .padding(.vertical,15)
    }
    
    var didnotRecive: some View{
        HStack{
            
            Text("Didn't receive?")
                .FontForegroundColorModifier(15, .medium, .default, .standard, nil, nil, .secondary)
            
            Text("Resend in 00:0\(time)")
                .FontForegroundColorModifier(15, .medium, .default, .standard, nil, nil, Color("purple"))
            
        }
    }
    
    var continueButton: some View {
        Button(action: {
            focuse = 1
            showPasswordView = true
        }, label: {
            Text("Continue")
                .FontForegroundColorModifier(16, .bold, .default, .standard, nil, nil, Color.white)
                .frame(maxWidth: .infinity)
                .FrameBackgroundColorModifier(nil, 45, Color("purple"), 1, 35)
                .padding(.horizontal,50)
        })
        .navigationDestination(isPresented: $showPasswordView) {
            PasswordView()
        }
    }
    
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView()
    }
}
