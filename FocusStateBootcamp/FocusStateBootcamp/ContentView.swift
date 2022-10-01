//
//  ContentView.swift
//  FocusStateBootcamp
//
//  Created by Bishowjit Ray on 30/9/22.
//

import SwiftUI

struct ContentView: View {
    enum OnboardingField: Hashable {
        case username
        case password
    }
    
  //  @FocusState private var usernameInFocus: Bool
    @State private var username: String = ""
    
   // @FocusState private var PasswordInFocus: Bool
    @State private var password: String = ""
    
    @FocusState private var fieldInfocus: OnboardingField?
    
    var body: some View {
        VStack {
            TextField("Add your name here", text: $username)
            
                .focused($fieldInfocus, equals: .username)
               // .focused($usernameInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            SecureField("Add your Password here", text: $password)
                .focused($fieldInfocus, equals: .password)
                //.focused($PasswordInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            Button ("SIGN UP 👻")
            {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                if usernameIsValid && passwordIsValid {
                    print("SIGN UP")
                } else if usernameIsValid {
                    
                    fieldInfocus = .password
//                    usernameInFocus = false
//                    PasswordInFocus = true
//
                }
                else {
                    fieldInfocus = .username
                    
//                    usernameInFocus = true
//                    PasswordInFocus = false
                }
                
            }
//
//            Button ("TOGGLE FOCUS STATE")
//            {
//                usernameInFocus.toggle()
//            }
         }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
