//
//  HomeView.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showSheet = false
    
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            Text("Welcome!")
            
            Button(action: {
                showSheet.toggle()
            }) {
                Text("Go to profile")
            }
        }
        .sheet(isPresented: $showSheet) {
            LoginView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
