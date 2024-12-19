//
//  HospitalListView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 03/10/24.
//

import SwiftUI

// HospitalListView to display the list of hospitals
struct HospitalListView: View {
    // Sample data for hospitals
    let hospitals: [Hospital] = [
            Hospital(name: "Hospital One", bedsAvailable: 1, distance: 2.0, description: "Hospital One is a state-of-the-art facility providing the best healthcare services.", amenities: ["Free Wi-Fi", "Diet meals", "Medical amenities"], roomOptions: [RoomOption(price: "1500", type: "Deluxe Room", isAvailable: true), RoomOption(price: "700", type: "AC Room", isAvailable: false)]),
            Hospital(name: "Hospital Two", bedsAvailable: 4, distance: 2.4, description: "Hospital Two is known for its excellent cardiology department.", amenities: ["Soft mattress", "Free parking", "24/7 service"], roomOptions: [RoomOption(price: "1000", type: "Regular Room", isAvailable: true)]),
            // Add more hospital data here...
        ]
        
        var body: some View {
            NavigationView {
                VStack {
                    // Header
                    Text("Nearest Hospitals")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    // List of hospitals
                    List(hospitals) { hospital in
                        NavigationLink(destination: HospitalDetailView(hospital: hospital)) {
                            HStack {
                                // Hospital name and bed count
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(hospital.name)
                                        .font(.headline)
                                    
                                    HStack(spacing: 4) {
                                        Text("\(hospital.bedsAvailable)")
                                            .font(.body)
                                            .bold()
                                        Image(systemName: "bed.double.fill")
                                            .font(.body)
                                        Spacer()
                                        Text("\(hospital.distance, specifier: "%.1f") km away")
                                            .font(.body)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                            }
                            .padding(.vertical, 5)
                        }
                        .listStyle(PlainListStyle())
                    }
                    .padding()
                    .navigationBarBackButtonHidden(false) // Show back button
                }
            }
        }
    }

    struct HospitalListView_Previews: PreviewProvider {
        static var previews: some View {
            HospitalListView()
        }
    }


#Preview {
    HospitalListView()
}
