import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""
    @State private var showLoginAlert = false
    
    
    var body: some View {
        
        
        ZStack {
            // MARK: - Background Gradient
            LinearGradient(colors: [Color.purple, Color.blue, Color.green],startPoint: .topLeading,endPoint: .bottomTrailing)
            
           // LinearGradient(colors: [.blue,.black], startPoint: .leading, endPoint: .trailing)
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
                
                Text("TMDB MOVIES")
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
                    
                    Button(action: {
                        if username == "Sagar" && password == "1234" {
                            withAnimation {
                                isLoggedIn = true
                            }
                        } else {
                            withAnimation {
                                showLoginAlert = true
                            }
                        }
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                //LinearGradient(colors: [.blue, .green], startPoint: .leading, endPoint: .trailing)
                                LinearGradient(colors: [.blue,.black], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(12)
                            .shadow(radius:5)
                    }
                }.padding(.horizontal)
                
                VStack(spacing: 8) {
                    
                    Text("Don't have an account?")
                        .font(.caption)
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .underline()
                    }
                    
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(25)
            .shadow(radius: 20)
            .padding(.horizontal, 32)
            
            // ✅ Custom Alert on Login Failure
            if showLoginAlert {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                CustomAlertView(
                    title: "Login Failed",
                    message: "Invalid username or password."
                ) {
                    withAnimation {
                        showLoginAlert = false
                    }
                }
                .transition(.scale)
                .zIndex(11)
            }
        }
    }
}



