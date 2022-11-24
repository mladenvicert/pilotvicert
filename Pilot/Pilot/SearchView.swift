//
//  SearchView.swift
//  Pilot
//
//  Created by Mladen Rabasovic on 23.11.22..
//

import SwiftUI

class SearchModel: ObservableObject {
    @Published var doctors = ["Mladen Rabasovic", "Veljko Rabasovic", "Nenad Rabasovic", "Velimir Rabasovic"]
}

struct SearchView: View {
    @StateObject var viewModel = SearchModel()
    
    @State private var searchQuery: String = ""
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                VStack {
                    Button("Jump to #50") {
                        proxy.scrollTo(50, anchor: .top)
                    }
                    
                    List(0..<100, id: \.self) { i in
                        Text("Example \(i)")
                            .id(i)
                    }
                    .searchable(text: $searchQuery)
                }
            }
            .navigationTitle("Navigation")
            
        }
    }
    
    var searchResults: [String] {
        if searchQuery.isEmpty {
            return viewModel.doctors
        } else {
            return viewModel.doctors.filter { $0.contains(searchQuery) }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
