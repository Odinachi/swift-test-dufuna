//
//  LoginScreen.swift
//  dufunatest
//
//  Created by  Apple on 14/06/2024.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject var viewModel = AppViewModel.shared
    
    @State private var username: String = ""
    
    @State private var password: String = ""
    
    @State private var remember: Bool = false
    
    @State private var navigateToHome = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Spacer()
                VStack (alignment: .leading,  content: {
                    Text("Welcome back!👋")
                        .font(.title)
                        .foregroundColor(.black).fontWeight(.bold)
                    
                    
                    Text("Fill your details to get started")
                        .font(.subheadline).foregroundColor(Color("Gray"))
                        .padding(.bottom, 20)
                }).padding(.leading, 16).frame(maxWidth: .infinity, alignment: .leading) // Ensure the VStack starts from the
                
                
                
                TextField("Username", text: $username)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never).padding()
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color("Gray"), lineWidth: 2)
                    )
                    .padding()
                
                
                SecureField("Password", text: $password)
                    .textContentType(.newPassword)
                    .padding()
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color("Gray"), lineWidth: 2)
                    ).padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                HStack {
                    HStack{
                        
                        Image(systemName: remember ? "checkmark.square.fill": "rectangle").resizable().frame(width: 18, height: 18).foregroundColor(remember ? Color("PrimaryColor"):Color("Gray"))
                        Text("Remember me").foregroundColor(Color("Gray")).fontWeight(.regular).font(.system(size: 14))
                        
                    }.onTapGesture(perform: {
                        //toggle remeber me
                        remember = !remember
                    })
                    Spacer()
                    
                    Text("Forgot Password?").foregroundColor(.red).fontWeight(.regular).font(.system(size: 14))
                }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                
                
                Button(action: {
                    //we only want to make the call when username and password is not empty
                    if !username.isEmpty && !password.isEmpty {
                        viewModel.login(username, password)
                    }
                }) {
                    Text("Sign in")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 13))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color( (username.isEmpty || password.isEmpty ) ? "Gray" : "PrimaryColor"))
                        .cornerRadius(4)
                        .padding()
                }
                .disabled(viewModel.isLoading ||  username.isEmpty || password.isEmpty).onChange(of: viewModel.isLoggedIn) { oldState, newState in
               
                    if newState {
                      //we toggle the navigate flag after the user is logged in
                        navigateToHome = true
                    }
                }.navigationDestination(isPresented: $navigateToHome, destination: {
                    HomeScreen()
                })
                //loading
                if viewModel.isLoading {
                    ProgressView("Logging in...")
                        .padding()
                }
                //show error message
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                
                Text("Don’t have an account? ").foregroundColor(Color("Gray")).fontWeight(.regular).font(.system(size: 14)) +
                Text("Contact Support").foregroundColor(Color("PrimaryColor")).fontWeight(.regular).font(.system(size: 14))
                
                Spacer()
                
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content:  {
                    Text("By clicking ‘Sign in’ above you agree to Arocare’s ")
                        .foregroundColor(Color("Gray"))
                        .fontWeight(.regular)
                        .font(.system(size: 13)) +
                    Text("Terms & Conditions")
                        .foregroundColor(Color("PrimaryColor"))
                        .fontWeight(.regular)
                        .font(.system(size: 13)) +
                    Text(" and ")
                        .foregroundColor(Color("Gray"))
                        .fontWeight(.regular)
                        .font(.system(size: 13)) +
                    Text("Privacy Policy.")
                        .foregroundColor(Color("PrimaryColor"))
                        .fontWeight(.regular)
                        .font(.system(size: 13))
                }).multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    LoginScreen()
}
