//
//  SignInView.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var emptyFields = false
    
    var body: some View {
        VStack(spacing: SignInConstants.bodySpacing) {
            VStack(spacing: SignInConstants.imageSpacing) {
                Image(LocalizableKeys.SignIn.image)
                    .resizable()
                    .scaledToFit()
                
                Text(LocalizableKeys.SignIn.title)
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
            }
            
            VStack(spacing: SignInConstants.textFieldSpacing) {
                TextField(LocalizableKeys.SignIn.emailPlaceholder, text: $email)
                    .textFieldStyle(SignInTextFieldStyle())
                
                SecureField(LocalizableKeys.SignIn.passwordPlaceholder, text: $password)
                    .textFieldStyle(SignInTextFieldStyle())
            }
            
            Spacer()
            
            VStack(spacing: SignInConstants.buttonSpacing) {
                Button(action: {
                    if email == "" || password == "" {
                        emptyFields = true
                    }
                }) {
                    Text(LocalizableKeys.SignIn.signInButtonTitle)
                }
                .alert(isPresented: $emptyFields) {
                    Alert(title: Text("EMPTY FIELDS"), message: Text("Please, fill the fields"), dismissButton: .cancel(Text("Accept")))
                }
                .buttonStyle(SignInButtonStyle())
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text(LocalizableKeys.SignIn.registerQuestionButtonTitle)
                        .font(.system(size: SignInConstants.contentTextSize)) +
                    Text(LocalizableKeys.SignIn.registerButtonTitle)
                        .bold()
                        .font(.system(size: SignInConstants.contentTextSize))
                }
                .foregroundColor(Color.black)
                .font(.system(size: SignInConstants.contentTextSize))
            }
            
        }.padding(.all, SignInConstants.marginPadding)
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
