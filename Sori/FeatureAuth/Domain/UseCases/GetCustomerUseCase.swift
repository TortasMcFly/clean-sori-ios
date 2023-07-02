//
//  GetCustomerUseCase.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Foundation

protocol GetCustomerUseCaseProtocol {
    
    func execute() -> Customer?
    
}

class GetCustomerUseCase: GetCustomerUseCaseProtocol {
    
    private let repository: AuthRepositoryProtocol
    
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> Customer? {
        return self.repository.getCustomer()
    }
}
