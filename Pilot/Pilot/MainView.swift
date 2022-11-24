//
//  MainView.swift
//  Pilot
//
//  Created by Mladen Rabasovic on 22.11.22..
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            Text("Welcome to Vicert HIS")
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            DoctorView()
                .tabItem {
                    Label("Doctor", systemImage: "stethoscope")
                }
            Patient()
                .tabItem {
                    Label("Patient", systemImage: "figure.2.arms.open")
                }
                
            Appointment()
                .tabItem {
                    Label("Appointment", systemImage: "wallet.pass")
                }
            More()
                .tabItem {
                    Label("More", systemImage: "ellipsis")
                }
        }
        .accentColor(Color("vicertLightBlue"))  // TODO promeni boju?
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
