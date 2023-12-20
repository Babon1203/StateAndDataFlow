//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .padding(.trailing, 50)
                .foregroundColor(name.count < 3 ? .red : .green)            }
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
                    .foregroundColor(name.count >= 3 ? .green : .gray)
            }
            .disabled(name.count < 3 ? true : false)
            .padding()
        }
    }
    
    private func login() {
        if !name.isEmpty {
            userManager.name = name
            userManager.isLoggedIn.toggle()
        }
    }
    
}

#Preview {
    LoginView()
}
