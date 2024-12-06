//
//  SignUpDataModel.swift
//  Fitness
//
//  Created by Apple on 03/12/2024.
//

import Foundation

struct PhoneNoCountryCodes: Codable ,Identifiable {
    
    var id: String
    var name: String
    var flag: String
    var code: String
    var dial_code: String
    var pattern: String
    var limit: CGFloat
    
}
