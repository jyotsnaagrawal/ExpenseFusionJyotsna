//
//  LogInView.swift
//  ExpenseFusionJyotsna
//
//  Created by student on 4/18/24.
//

import SwiftUI

struct LoginView: View {
    // State variables to hold username, password, and button state
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginButtonDisabled = true // State to manage button enabled/disabled
    @State private var showCreateAccount = false // State to control navigation to CreateAccountView
    
    var body: some View {
        VStack {
            // Customized logo
            Image("1")
                .resizable()
                .aspectRatio(contentMode: .fill) // Adjust aspect ratio
                .frame(width: 300, height: 200) // Adjust frame size
                .padding(.bottom, 30)
                .clipShape(Circle()) // Clip the image within a circle shape
                .overlay(
                    Circle() // Add a circle overlay
                        .stroke(Color.white, lineWidth: 5) // Apply white border
                )
            
            // Username text field
            TextField("Username", text: $username)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.8)))
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 20)
                .foregroundColor(.black) // Text field color
                .autocapitalization(.none) // Prevent auto-capitalization
                .disableAutocorrection(true) // Disable autocorrection
            
            // Password secure field
            SecureField("Password", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.8)))
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .foregroundColor(.black) // Text field color
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            // Login button
            Button(action: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    // Perform login operation here
                }
            }) {
                Text("Login")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue)) // Use your primary color here
                    .padding(.horizontal, 20)
                    .disabled(isLoginButtonDisabled) // Disable button if credentials are incomplete
            }
            .onReceive([self.username, self.password].publisher) { _ in
                // Enable/disable login button based on whether both fields are filled
                self.isLoginButtonDisabled = self.username.isEmpty || self.password.isEmpty
            }
            
            // Customized Apple login button with Apple logo
            Button(action: {
                // Handle login with Apple ID
            }) {
                HStack {
                    Image(systemName: "applelogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text("Sign in with Apple")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.black)) // Use your primary color here
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 10)
            
            // Customized Google login button with Google logo
            Button(action: {
                // Handle login with Google
            }) {
                HStack {
                    Image("google_logo") // Replace with your actual image asset name
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text("Sign in with Google")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.red)) // Use your primary color here
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
            
            // Navigation to CreateAccountView
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.white)
                Button(action: {
                    // Toggle showCreateAccount to navigate to CreateAccountView
                    showCreateAccount.toggle()
                }) {
                    Text("SignUp")
                        .foregroundColor(.blue)
                }
            }
            .padding(.top, 20)
            
            Spacer() // Push content to the top
        }
        .padding() // Add padding to the entire VStack
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
        ) // Apply background gradient
        .sheet(isPresented: $showCreateAccount) {
            // Present CreateAccountView when showCreateAccount is true
            CreateAccountView(isPresented: $showCreateAccount)
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
