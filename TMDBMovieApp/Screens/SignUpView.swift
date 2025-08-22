//
//  SignUpView.swift
//  TheProfile
//
//  Created by Sagar Rathode   on 09/07/25.
//

import SwiftUI
struct SignUpView: View {
   
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showCreateAccountAlert = false

    
    var body: some View {
        ZStack {
            // MARK: - Background Gradient
            LinearGradient(
                colors: [Color.purple, Color.blue, Color.green],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // MARK: - Glassmorphism Login Card
            VStack(spacing: 24) {
                // Profile Circle
                Image("prof")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                
                Text("Create Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(spacing: 16) {
                    TextField("Username", text: $username)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .foregroundColor(.white)

                    var passwordsMatch: Bool {
                        !confirmPassword.isEmpty && password == confirmPassword
                    }

                    HStack {
                            SecureField("Confirm Password", text: $confirmPassword)
                                .foregroundColor(.white)

                            if passwordsMatch {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }else{
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                    
                    Button(action: {
                        
                        if password != confirmPassword{
                                withAnimation {
                                    showCreateAccountAlert = true
                                }
                            } else {
                                // Example: Save the new user or dismiss the sign-up screen
                                print("Account created for \\(username) \\(password)")
                                showCreateAccountAlert = true
                            }
                    }) {
                        Text("Create Account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                //LinearGradient(colors: [.blue, .green], startPoint: .leading, endPoint: .trailing)
                                LinearGradient(colors: [.blue,.black], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(25)
                .shadow(radius: 20)
                .padding(.horizontal, 32)
                .navigationTitle("Create Account")
                .toolbarRole(.editor)
                
                
                // ✅ Custom Alert on Login Failure
                if showCreateAccountAlert {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    CustomAlertView(
                        title: "Account creation Failed",
                        message: "Invalid password & Confirm password combination."
                    ) {
                        withAnimation {
                            showCreateAccountAlert = false
                        }
                    }
                    .padding(.bottom, 120)
                    .transition(.scale)
                    .zIndex(11)
                }
            }
            
        }
    }
        
        
}
