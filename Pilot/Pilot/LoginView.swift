//
//  LoginView.swift
//  Pilot
//
//  Created by Mladen Rabasovic on 23.11.22..
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("vicertLightBlue").opacity(0.1), Color("vicertLightBlue").opacity(0.7)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Login")
                    //.font(.headline)
                    .font(.system(size: 30))
                    .foregroundColor(Color("vicertLightBlue"))
                    .bold()
                Group {
                    TextField("USERNAME", text: $username)
                    TextField("PASSWORD", text: $password)
                }
                //.overlay(RoundedRectangle(cornerSize: 10).background(.black))
                Button {
                    print(123)
                } label: {
                    Text("LOGIN")
                }
                .padding()
                .background(Color("vicertLightBlue"))
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 5)
                
                Text("Don't have an account?")
                Button {
                    print("Create one")
                } label: {
                    Text("CREATE ONE")
                }
                Spacer()
                Image("vicertLogo")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.horizontal)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
