//
//  CreatePatientView.swift
//  Pilot
//
//  Created by Mladen Rabasovic on 23.11.22..
//

import SwiftUI

struct CreatePatientView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var address: String = ""
    @State private var dateOfBirth: String = "" //  TODO vidi koji je to tip
    @State private var ssn: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("FIRST NAME", text: $firstName)
                    TextField("LAST NAME", text: $lastName)
                    TextField("EMAIL", text: $email)
                    TextField("PHONE", text: $phone)
                    TextField("PASSWORD", text: $password)
                    TextField("CONFIRM PASSWORD", text: $confirmPassword)
                    TextField("ADDRESS", text: $address)
                    TextField("DATE OF BIRTH", text: $dateOfBirth)
                    TextField("SSN", text: $ssn)
                }
                .padding(.top, 20)
                Button {
                    print("create")
                } label: {
                    Text("Create")
                }
                .padding()
                .background(Color("vicertLightBlue"))
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 5)

            }
            .navigationTitle("New Patient")
        }
    }
}

struct CreatePatientView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePatientView()
    }
}
