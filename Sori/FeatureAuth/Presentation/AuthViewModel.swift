//
//  ViewModel.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    
    private let useCases: AuthUseCasesWrapper
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    @Published var isGuest: Bool = false
    @Published var loading: Bool = false
    @Published var showAlert: Bool = false
    @Published var messageAlert: String = ""
    
    init(useCases: AuthUseCasesWrapper) {
        self.useCases = useCases
        refreshSession()
    }
    
    func refreshSession() {
        let customer = useCases.getCustomerUseCase.execute()
        
        if customer == nil {
            getGuestToken()
            return
        }
        
        refreshToken(session: customer!)
        
    }
    
    private func getGuestToken() {
        useCases.createGuestTokenUseCase.execute()
            .sink { result in
                
                switch result {
                case .success(let customer):
                    self.isGuest = customer.isGuest()
                    self.onGetSession(session: customer)
                    break
                case .failure(let error):
                    self.showAlert = true
                    self.messageAlert = error.backendError?.message ?? error.message ?? "Ocurrió un error"
                    break
                }
                
            }
            .store(in: &cancellableSet)
    }
    
    private func refreshToken(session: Session) {
        useCases.refreshTokenUseCase.execute(refreshToken: session.refreshToken)
            .sink { result in
                switch result {
                case .success(let customer):
                    self.isGuest = customer.isGuest()
                    self.onGetSession(session: customer)
                    break
                case .failure(let error):
                    if error.backendError?.status == 401 {
                        self.signIn(email: session.email, password: session.password)
                        return
                    }
                
                    self.showAlert = true
                    self.messageAlert = error.backendError?.message ?? error.message ?? "Ocurrió un error"
                    break
                }
            }
            .store(in: &cancellableSet)
    }
    
    private func signIn(email: String, password: String) {
        useCases.signInUseCase.execute(email: email, password: password)
            .sink { result in
                switch result {
                case .success(let customer):
                    self.isGuest = customer.isGuest()
                    self.onGetSession(session: customer)
                    break
                case .failure(let error):
                    self.showAlert = true
                    self.messageAlert = error.backendError?.message ?? error.message ?? "Ocurrió un error"
                    break
                }
            }
            .store(in: &cancellableSet)
    }
    
    func onGetSession(session: Session?) {
        fatalError("Subclasses must implement abstractMethod.")
    }
    
}
