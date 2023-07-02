//
//  HomeViewModel.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import Foundation

class HomeViewModel: AuthViewModel {
    
    private var event: Events = .initial
    
    override func onGetSession(session: Session?) {
        switch event {
        case .initial:
            getHome()
            break
        case .paginate(let nextPage):
            paginar(nextPage: nextPage)
            break
        case .favoritos:
            getFavoritos()
            break
        }
    }
    
    
    private func getHome() {
        // get categories
            // getFavoritos
                onAction(event: .favoritos)
    }
        
    func onAction(event: Events) {
        self.event = event
        refreshSession()
    }
    
    private func getFavoritos() {
        // get favoritos
    }
    
    private func paginar(nextPage: NextPage) {
        // get next page
    }
    
    enum Events {
        case initial
        case paginate(NextPage)
        case favoritos
    }
    
    struct NextPage {
        let offset, limit: Int
    }
}
