//
//  SignInUseCase.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Combine
import Foundation

protocol SignInUseCaseProtocol {
    
    func execute(email: String, password: String) -> AnyPublisher<Result<Customer, DomainError>, Never>
    
}

class SignInUseCase: SignInUseCaseProtocol {
    
    private let repository: AuthRepositoryProtocol
    
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(email: String, password: String) -> AnyPublisher<Result<Customer, DomainError>, Never> {
        return self.repository.signIn(email: email, password: password)
    }
    
}
