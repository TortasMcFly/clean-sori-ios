//
//  NetworkError.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Foundation

struct DomainError: Error {
    let message: String?
    let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: Int
    var message: String
}
