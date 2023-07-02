//
//  LoginView.swift
//  Sori
//
//  Created by Hector Luevano on 02/07/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (spacing: 30){
            
            VStack (spacing: 10){
                Text("Login")
                    .font(.title)
                    .padding([.horizontal], 20)
                    .bold()
                
                Text("Inicia sesión para continuar")
                    .font(.body)
                    .padding([.horizontal], 20)
                    .foregroundColor(.gray)
            }
            
            VStack (spacing: 30) {
                
                TextField("Email", text: $email)
                    .padding(20)
                    .background(Color.themeTextField)
                    .cornerRadius(15)
                
                SecureField("Password", text: $password)
                    .padding(20)
                    .background(Color.themeTextField)
                    .cornerRadius(15)
            }
            .padding([.horizontal], 20)
            
            VStack(alignment: .center) {
                Button(action: {
                    dismiss()
                }) {
                    Text("Sign In")
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(hex: 0xEBEBEB)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
