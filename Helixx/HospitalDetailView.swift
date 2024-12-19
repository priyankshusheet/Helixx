//
//  HospitalDetailView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 03/10/24.
//

// HospitalDetailView to show detailed information about a selected hospital
import SwiftUI

// Define a model for Hospital
struct Hospital: Identifiable {
    let id = UUID()
    let name: String
    let bedsAvailable: Int
    let distance: Double
    let description: String
    let amenities: [String]
    let roomOptions: [RoomOption]
}

// Define a model for Room options available in the hospital
struct RoomOption: Identifiable {
    let id = UUID()
    let price: String
    let type: String
    let isAvailable: Bool
}

struct HospitalDetailView: View {
    let hospital: Hospital
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Hospital image (replace with actual image handling)
                Image("hospitalImage") // Placeholder image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Hospital name and bed count
                Text(hospital.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Description
                Text(hospital.description)
                    .font(.body)
                    .padding(.horizontal)
                
                // Bed availability and distance
                HStack {
                    Text("\(hospital.bedsAvailable) beds available")
                        .font(.headline)
                    Spacer()
                    Text("\(hospital.distance, specifier: "%.1f") km away")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Amenities section
                Text("Amenities")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ForEach(hospital.amenities, id: \.self) { amenity in
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text(amenity)
                    }
                    .padding(.horizontal)
                }
                
                // Room options
                Text("Room Options")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(hospital.roomOptions) { room in
                        HStack {
                            Text("₹\(room.price)/day")
                                .bold()
                            Text(room.type)
                            Spacer()
                            Circle()
                                .fill(room.isAvailable ? Color.green : Color.red)
                                .frame(width: 20, height: 20)
                            Text(room.isAvailable ? "Available" : "Unavailable")
                                .foregroundColor(room.isAvailable ? .green : .red)
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Book now button
                Button(action: {
                    // Handle booking action
                }) {
                    Text("Book Now")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            .navigationBarTitle(hospital.name, displayMode: .inline)
        }
    }
}

struct HospitalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalDetailView(hospital: Hospital(name: "Lorem Ipsum", bedsAvailable: 4, distance: 2.0, description: "Lorem ipsum dolor sit amet...", amenities: ["Medical amenities", "Soft mattress", "Diet meals"], roomOptions: [RoomOption(price: "1500", type: "Deluxe Room", isAvailable: true), RoomOption(price: "700", type: "AC Room", isAvailable: false)]))
    }
}



#Preview {
    // Sample hospital data for preview purposes
    let sampleHospital = Hospital(
        name: "Sample Hospital",
        bedsAvailable: 5,
        distance: 3.2,
        description: "This is a sample hospital used for previewing the detailed view. It offers world-class medical services and excellent patient care.",
        amenities: ["Free Wi-Fi", "24/7 Service", "Emergency Room", "Pharmacy On-site"],
        roomOptions: [
            RoomOption(price: "1500", type: "Deluxe Room", isAvailable: true),
            RoomOption(price: "700", type: "Standard Room", isAvailable: false),
            RoomOption(price: "500", type: "Shared Room", isAvailable: true)
        ]
    )
    
    // Pass the sample hospital to HospitalDetailView
    HospitalDetailView(hospital: sampleHospital)
}
