//
//  Customer.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Foundation

class Customer: Session {
    
    let firstName: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case firstName
    }
    
}
