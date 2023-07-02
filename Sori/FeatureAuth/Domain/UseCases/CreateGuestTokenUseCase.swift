//
//  CreateGuestTokenUseCase.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Combine
import Foundation

protocol CreateGuestTokenUseCaseProtocol {
    
    func execute() -> AnyPublisher<Result<Customer, DomainError>, Never>
    
}

class CreateGuestTokenUseCase: CreateGuestTokenUseCaseProtocol {
    
    private let repository: AuthRepositoryProtocol
    
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<Result<Customer, DomainError>, Never> {
        self.repository.createGuestToken()
    }
    
}
