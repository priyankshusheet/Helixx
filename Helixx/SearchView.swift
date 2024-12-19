//
//  SearchView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 03/10/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var showHospitalList = false
    
    var body: some View {
        VStack {
            // Search Bar
            TextField("Search for hospitals", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {
                // When search is pressed, show the hospital list
                showHospitalList = true
            }) {
                Text("Search")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            Spacer()
        }
        .fullScreenCover(isPresented: $showHospitalList) {
            // Show Hospital List when search is triggered
            HospitalListView()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


#Preview {
    SearchView()
}
