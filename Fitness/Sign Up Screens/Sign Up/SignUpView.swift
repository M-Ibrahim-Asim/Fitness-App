//
//  SignUpView.swift
//  Fitness
//
//  Created by Apple on 02/12/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var phoneNumber: String = ""
    @State var countriesCodeDataList: [PhoneNoCountryCodes] = []
    @State var selectedCountryCode: PhoneNoCountryCodes? = nil
    @State var showSheet: Bool = false
    @State var showValidationCodeView: Bool = false
    
    @ObservedObject var signUpVM = SignUpViewModel()
    
    var body: some View {
        VStack{
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120 ,height: 60)
            
            Spacer()
            
            text
            
            phoneNoTextField
            
            Spacer()
            
            button
            
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .onAppear{
            countriesCodeDataList = signUpVM.loadData()
            selectedCountryCode = countriesCodeDataList.first
        }
    }
    
    var text: some View {
        Text("Let's start with your mobile \n number")
            .FontForegroundColorModifier(23, .heavy, .rounded, .standard, nil, nil, .primary)
            .multilineTextAlignment(.center)
            .padding(.horizontal,10)
//                .lineSpacing(4)
//                .padding(.vertical,7)
    }
    
    var phoneNoTextField: some View {
        VStack{
            HStack{
                
                Button(action: {
                    showSheet = true
                }, label: {
                    if let selectedCountryCode = selectedCountryCode{
                        HStack{
                            Text(selectedCountryCode.flag)
                            Text(selectedCountryCode.dial_code)
                        }
                        .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, .primary)
                        .padding(.leading,2)
                    }else{
                        Text("Select Country")
                            .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, .primary)
                    }
                    
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .FontForegroundColorModifier(15, .bold, .rounded, .standard, 12, 8, Color("purple"))
                        .padding(.horizontal,10)
                    
                })
                
                TextField("Enter your mobile number", text: $phoneNumber)
    //                    .keyboardType(.numberPad)
                    .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, .primary)
                
            }
            .padding()
            .FrameBackgroundColorModifier(nil, nil, Color("Primary"), 1, 13)
            .padding(.horizontal,20)
            .shadow(radius: 5,x: 2,y: 2)
            .sheet(isPresented: $showSheet) {
                countriesCodeView
                    .presentationDetents([.medium,.large])
            }   
            .onChange(of: phoneNumber) { newValue in
                if !phoneNumber.isEmpty{
                    signUpVM.errorMsg = ""
                }
            }
            
            if !signUpVM.errorMsg.isEmpty {
                Text(signUpVM.errorMsg)
                    .foregroundColor(.red)
            }
        }
    }
    
    var countriesCodeView: some View {
        ScrollView{
            VStack{
                ForEach(countriesCodeDataList) { code in
                    Button(action: {
                        selectedCountryCode = code
                        showSheet = false
                    }, label: {
                        HStack{
                            Text("\(code.flag)")
                                .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, .primary)
                            Text("\(code.name)")
                                .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, .primary)
                            Spacer()
                            
                            Text("\(code.dial_code)")
                                .FontForegroundColorModifier(18, .regular, .default, .standard, nil, nil, Color(.systemGray2))
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical,10)
                    })
                }
            }
            .padding()
        }
    }
    
    var button: some View {
        Button(action: {
            let status = signUpVM.checkValidation(phoneNumber)
            if status == true {
                showValidationCodeView.toggle()
            }
        }, label: {
            Text("Continue")
                .FontForegroundColorModifier(16, .bold, .default, .standard, nil, nil, Color.white)
                .frame(maxWidth: .infinity)
                .FrameBackgroundColorModifier(nil, 45, Color("purple"), 1, 35)
                .padding(.horizontal,50)
        })
        .navigationDestination(isPresented: $showValidationCodeView) {
            VerificationCodeView()
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
