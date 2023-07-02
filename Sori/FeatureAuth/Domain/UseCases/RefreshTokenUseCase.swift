//
//  RefreshTokenUseCase.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Combine
import Foundation

protocol RefreshTokenUseCaseProtocol {
    func execute(refreshToken: String) -> AnyPublisher<Result<Customer, DomainError>, Never>
}

class RefreshTokenUseCase: RefreshTokenUseCaseProtocol {
    
    private let repository: AuthRepositoryProtocol
    
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(refreshToken: String) -> AnyPublisher<Result<Customer, DomainError>, Never> {
        return self.repository.refreshToken(refreshToken: refreshToken)
    }
    
}
