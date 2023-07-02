//
//  Session.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Foundation

class Session: Codable {
    let authType, customerID, refreshToken, defaultStoreID: String
    let defaultPostalCode: String
    let token: String
    let email: String
    let password: String

    enum CodingKeys: String, CodingKey {
        case authType
        case customerID = "customerId"
        case refreshToken = "refresh_token"
        case defaultStoreID = "defaultStoreId"
        case defaultPostalCode
        case token
        case email
        case password
    }
    
    func isGuest() -> Bool {
        return authType.lowercased() == "guest"
    }
}
