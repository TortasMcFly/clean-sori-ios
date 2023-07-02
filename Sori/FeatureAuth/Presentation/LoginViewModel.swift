//
//  LoginViewModel.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Foundation
import Combine

class LoginViewModel {
    
    private let signInUseCase: SignInUseCaseProtocol
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    @Published var state: LoginState = LoginState()
    
    init(signInUseCase: SignInUseCaseProtocol) {
        self.signInUseCase = signInUseCase
    }
    
    func login(email: String, password: String) {
        
        self.state.loading = true
        
        signInUseCase.execute(email: email, password: password)
            .sink { result in
                self.state.loading = false
                
                switch result {
                    case .success(_):
                    self.state.navigateToHome = true
                        break
                        
                    case .failure(let error):
                        self.state.showAlert = true
                        self.state.messageAlert = error.message ?? "Ocurrió un error"
                        break
                }
            }
            .store(in: &cancellableSet)
        
    }
    
    struct LoginState {
        var loading: Bool = false
        var messageAlert: String = ""
        var showAlert: Bool = false
        var navigateToHome: Bool = false
    }
    
}

