//
//  LoginView.swift
//  Snacktacular
//
//  Created by Tushar Munge on 8/20/25.
//

import Firebase
import FirebaseAuth
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 10) {
                Group {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .submitLabel(.next)
                    
                    SecureField("Password", text: $password)
                        .submitLabel(.done)
                }
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(Color(.snack), lineWidth: 1.0)
                }
                
                HStack {
                    Button("Sign Up") {
                        register()
                    }
                    .padding(.trailing)
                    
                    Button("Log In") {
                        login()
                    }
                    .padding(.leading)
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.snack)
                .padding(.top)
            }
            .padding(30)
            .background(Color(.systemGray3))
            .cornerRadius(10)
        }
        .padding()
        .alert(alertMessage, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("😡 SIGN UP ERROR: \(error.localizedDescription)")
                
                alertMessage = "😡 LOGIN ERROR: \(error.localizedDescription)"
                showingAlert = true
            } else {
                print("Registration Successful!")
                
                // TODO: Load List view
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("😡 LOG IN ERROR: \(error.localizedDescription)")
                
                alertMessage = "😡 LOGIN ERROR: \(error.localizedDescription)"
                showingAlert = true
            } else {
                print("Log In Successful!")
                
                // TODO: Load List view
            }
        }
    }
}

#Preview {
    LoginView()
}
