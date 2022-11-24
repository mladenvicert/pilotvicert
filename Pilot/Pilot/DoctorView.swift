//
//  Doctor.swift
//  Pilot
//
//  Created by Mladen Rabasovic on 22.11.22..
//

import SwiftUI

class DoctorsViewModel: ObservableObject {
    @Published var doctors: [Result] = []
//    @Published var doctors: [Doctor] = [Doctor(firstName: "Mladen", lastName: "Rabasovic", email: "mladen@gmail.com", phoneNumber: "0607272919"), Doctor(firstName: "Veljko", lastName: "Rabasovic", email: "veljko@gmail.com", phoneNumber: "0607272919"), Doctor(firstName: "Nenad", lastName: "Rabasovic", email: "nenad@gmail.com", phoneNumber: "0607272919")]

    func fetchDoctors() {
        let token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqYW5lQHZoaXMuY29tIiwianRpIjoiYzQ4NzE3MmQtMjQ5OS00NzczLWFjODgtYWUxYjUxZDJjZmNiIiwiZW1haWwiOiJqYW5lQHZoaXMuY29tIiwiaWQiOiI0MWY3MWEyMy0wZjgxLTRkNDItOTllZC1iY2I0N2ExODQ5MjIiLCJyb2xlcyI6IlRFQ0hOSUNJQU4iLCJuYmYiOjE2NjkzMDIxNDQsImV4cCI6MTY2OTMwNTc0NCwiaWF0IjoxNjY5MzAyMTQ0fQ.JfUWgO5Ly1sTxO9znlbsxFUA6RSTaSG9BvIB0-Ms2R0"
        guard let url = URL(string: "http://192.168.100.38:81/api/Doctor/getall") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let decodedDoctors = try JSONDecoder().decode(Doctor.self, from: data)
                let doctorsArray = decodedDoctors.result
                print(decodedDoctors)
                DispatchQueue.main.async {
                    self?.doctors = doctorsArray
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}


struct DoctorView: View {

    @StateObject var viewModel = DoctorsViewModel()
    @State private var didTap: Bool = false
    @State private var searchQuery: String = ""

    var body: some View {
        NavigationView {
            List(filteredDoctors) { doctor in
                NavigationLink(destination: {
                    DoctorDetailView(doctorId: "4b74a1b6-ae14-4090-979c-fa5443d64d3a")
                }, label: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(doctor.firstName) \(doctor.lastName)")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("\(doctor.email)")
                            Text("\(doctor.phone)")
                        }
                    }
                    
                })
                
            }
            //.onDelete(perform: delete)  // ovo je da bi mogao delete na swipe i ne znam gde treba da ide
            .listStyle(.grouped)
            .searchable(text: $searchQuery)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        didTap.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Doctor")
                                .fontWeight(.semibold)
                            
                        }
                    }
                    .buttonStyle(LightBlueButtonStyle())
                }
            }
            .navigationTitle("Doctors")
            .onAppear {
                viewModel.fetchDoctors()
            }
            
        }
    }
    
    var filteredDoctors: [Result] {
        if searchQuery.isEmpty {
            return viewModel.doctors
        } else {
            return viewModel.doctors.filter { "\($0.firstName) \($0.lastName)".contains(searchQuery) }
        }
    }
    
    // TODO
    func delete(at: IndexSet) {
        print(123)
    }
}

struct LightBlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 10)
            .background(configuration.isPressed ? Color("vicertLightBlue").opacity(0.8) : Color("vicertLightBlue"))
            .foregroundColor(.black)
            .cornerRadius(10)
    }
}

struct DoctorView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorView()
    }
}
