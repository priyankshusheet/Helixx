//
//  PatientInfoView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 03/10/24.
//

import SwiftUI

struct PatientInfoView: View {
    // State variables to store user input
    @State private var address: String = ""
    @State private var altPhoneNumber: String = ""
    @State private var bloodGroup: String = ""
    @State private var age: String = ""
    @State private var gender: String = ""
    @State private var medicalCondition: String = ""
    @State private var severityLevel: String = "Low"
    @State private var allergies: String = ""
    @State private var medications: String = ""
    @State private var medicalHistory: String = ""
    
    // For Gender Picker
    let genders = ["Male", "Female", "Other"]
    
    // For Severity Level
    let severityLevels = ["Low", "Medium", "High"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basic Info:")) {
                    TextField("Address", text: $address)
                    TextField("Alternate Ph. no. (Optional)", text: $altPhoneNumber)
                        .placeholder(when: altPhoneNumber.isEmpty) {
                        }
                    TextField("Blood Group", text: $bloodGroup)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                    
                    Picker("Gender", selection: $gender) {
                        ForEach(genders, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Medical Info:")) {
                    TextField("Medical condition", text: $medicalCondition)
                    
                    HStack {
                        Text("Severity level")
                        Spacer()
                        Picker("Severity", selection: $severityLevel) {
                            ForEach(severityLevels, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    TextField("Allergies", text: $allergies)
                    TextField("Current medications", text: $medications)
                    TextField("Medical history", text: $medicalHistory)
                }
                
                Button(action: {
                    // Save details action here
                    print("Patient information saved.")
                }) {
                    Text("Save Details")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
            }
            .navigationTitle("User Information")
        }
    }
}

extension View {
    // Placeholder modifier for optional text fields
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct PatientInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PatientInfoView()
    }
}

#Preview {
    PatientInfoView()
}
