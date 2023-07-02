//
//  UseCaseWrapper.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Foundation

class AuthUseCasesWrapper {
    var refreshTokenUseCase: RefreshTokenUseCaseProtocol
    var createGuestTokenUseCase: CreateGuestTokenUseCaseProtocol
    var getCustomerUseCase: GetCustomerUseCaseProtocol
    var signInUseCase: SignInUseCaseProtocol
    
    init(
        refreshTokenUseCase: RefreshTokenUseCaseProtocol,
        createGuestTokenUseCase: CreateGuestTokenUseCaseProtocol,
        getCustomerUseCase: GetCustomerUseCaseProtocol,
        signInUseCase: SignInUseCaseProtocol
    ) {
        self.refreshTokenUseCase = refreshTokenUseCase
        self.createGuestTokenUseCase = createGuestTokenUseCase
        self.getCustomerUseCase = getCustomerUseCase
        self.signInUseCase = signInUseCase
    }
    
}
