//
//  SignUpViewModel.swift
//  Fitness
//
//  Created by Apple on 03/12/2024.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var errorMsg: String = ""
    
    func checkValidation(_ phoneNo: String) -> Bool {
        
        if phoneNo.isEmpty == true {
            errorMsg = "Please enter your mobile number."
            return false
        }
        return true
    }
    
    func loadData() -> [PhoneNoCountryCodes]{
        
        guard let url = Bundle.main.url(forResource: "CountryCodes", withExtension: "json") else {
                print("Json country code data found.")
                return []
            }
        
        do{
            let data = try Data(contentsOf: url)
            let countryCodes = try JSONDecoder().decode([PhoneNoCountryCodes].self, from: data)
//            self.countriesCodeDataList = countryCodes
            return countryCodes
            
        } catch {
            print("Failed to decode JSON: \(error)")
            return []
        }
        
    }
    
    
}
