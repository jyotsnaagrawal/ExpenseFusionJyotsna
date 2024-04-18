//
//  CreateAccountView.swift
//  ExpenseFusionJyotsna
//
//  Created by student on 4/18/24.
//

import SwiftUI

struct CreateAccountView: View {
    @Binding var isPresented: Bool
    
    // State variables to hold username, password, and button state
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSignUpButtonDisabled = true // State to manage button enabled/disabled
    
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
            
            // SignUp button
            Button(action: {
                // Perform signUp operation here
            }) {
                Text("Sign Up")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue)) // Use your primary color here
                    .padding(.horizontal, 20)
                    .disabled(isSignUpButtonDisabled) // Disable button if credentials are incomplete
            }
            .onReceive([self.username, self.password].publisher) { _ in
                // Enable/disable signUp button based on whether both fields are filled
                self.isSignUpButtonDisabled = self.username.isEmpty || self.password.isEmpty
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
        .onDisappear {
            // Close the SignUpView and show the LoginView when the SignUpView is dismissed
            isPresented.toggle()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(isPresented: .constant(true))
    }
}
