//
//  DoctorDetailView.swift
//  Pilot
//
//  Created by Mladen Rabasovic on 23.11.22..
//

import SwiftUI

struct DoctorDetailView: View {
    
    @State private var didTapEdit: Bool = false
    
    var doctorId: String
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Label("Virginia Apgar \(doctorId)", systemImage: "person.fill")
                        Label("Virginia Apgar", systemImage: "envelope.fill")
                        Label("Virginia Apgar", systemImage: "house.fill")
                        Label("Virginia Apgar", systemImage: "phone.fill")
                        Label("Virginia Apgar", systemImage: "calendar")
                    }
                    .font(.system(size: 20))
                    .padding(.horizontal)
                    Spacer()
                }
                Text("Free Appointments")
                    .font(.headline)
                    .padding(.top, 15)
                Button {
                    print(123)
                } label: {
                    Label("Delete Doctor", systemImage: "trash")
                        .padding(.all, 10)
                        .background(.red)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(10)
                        .opacity(didTapEdit ? 1 : 0)
                }

            }
            .navigationTitle(didTapEdit ? "Edit Doctor" : "Details")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        didTapEdit.toggle()
                    } label: {
                        Text(didTapEdit ? "Save" : "Edit")
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(LightBlueButtonStyle())
                }
            }
        }
    }
}

struct DoctorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailView(doctorId: "4b74a1b6-ae14-4090-979c-fa5443d64d3a")
    }
}
