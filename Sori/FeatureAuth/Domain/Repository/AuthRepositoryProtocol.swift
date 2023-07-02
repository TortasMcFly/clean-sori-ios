//
//  AuthRepository.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Foundation
import Combine

protocol AuthRepositoryProtocol {
    
    func signIn(email: String, password: String) -> AnyPublisher<Result<Customer, DomainError>, Never>
    
    func getCustomer() -> Customer?
    
    func refreshToken(refreshToken: String) -> AnyPublisher<Result<Customer, DomainError>, Never>
    
    func createGuestToken() -> AnyPublisher<Result<Customer, DomainError>, Never>
    
}
