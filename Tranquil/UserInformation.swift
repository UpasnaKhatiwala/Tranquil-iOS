//
//  UserInformation.swift
//  Tranquil
//
//  Created by Khushi Shukla on 2023-04-11.
//

import Foundation

class UserInformation {
    func saveData(emailAddress: String, password: String) {
        UserDefaults.standard.set(emailAddress, forKey: Constants.EMAIL + emailAddress)
        UserDefaults.standard.set(password, forKey: Constants.PASSWORD + emailAddress)
    }
    
    func getData(emailAddress: String) -> String? {
        let password = UserDefaults.standard.string(forKey: Constants.PASSWORD + emailAddress)
        return password
    }
}

struct Constants {
    static let EMAIL = "name"
    static let PASSWORD = "password"
}

struct UserInfo {
    var emailAddress: String
    var password: String
}
