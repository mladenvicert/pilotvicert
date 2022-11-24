//
//  RegisterView.swift
//  Pilot
//
//  Created by Mladen Rabasovic on 23.11.22..
//

import SwiftUI

struct RegisterView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var address: String = ""
    @State private var phone: String = ""
    @State private var dateOfBirth: String = "" //  TODO vidi koji je to tip
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    VStack(spacing: 20) {
                        Text("Register")
                            .font(.system(size: 30))
                            .foregroundColor(Color("vicertLightBlue"))
                            .bold()
                        NavigationView {
                            Form {
                                
                                TextField("FIRST NAME", text: $firstName)
                                TextField("LAST NAME", text: $lastName)
                                TextField("USERNAME", text: $username)
                                
                                
                            }
                        }
//                        Group {
//                            TextField("FIRST NAME", text: $firstName)
//                            TextField("LAST NAME", text: $lastName)
//                            TextField("USERNAME", text: $username)
//                            TextField("EMAIL", text: $email)
//                            TextField("PASSWORD", text: $password)
//                            TextField("CONFIRM PASSWORD", text: $confirmPassword)
//                            TextField("ADDRESS", text: $address)
//                            TextField("PHONE", text: $phone)
//                            TextField("DATE OF BIRTH", text: $dateOfBirth)
//                        }
//                        .overlay {
//                            //RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.7))
//
//                        }
                    }
                    Button {
                        print(123)
                    } label: {
                        Text("REGISTER")
                    }
                    .padding()
                    .background(Color("vicertLightBlue"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    Text("Already have an account?")
                    Button {
                        print(123)
                    } label: {
                        Text("SIGN IN")
                    }


                }
                .padding()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
