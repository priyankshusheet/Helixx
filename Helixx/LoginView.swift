//
//  SwiftUIView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 01/10/24.
//

import SwiftUI

struct LoginView: View {
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    HStack {
                        Image("backgroundTop") // Placeholder for top background
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Image("backgroundBottom") // Placeholder for bottom background
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
                
                VStack(spacing: 30) {
                    // Logo and Title
                    VStack {
                        Image(systemName: "cross.fill") // Placeholder for the symbol
                            .font(.largeTitle)
                            .foregroundColor(.blue) // Customize as per the app's logo style
                        Text("HELIX")
                            .font(.system(size: 40, weight: .bold, design: .serif))
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 100)
                    
                    // Name TextField
                    VStack(alignment: .leading) {
                        Text("Name")
                            .font(.body)
                            .bold()
                        TextField("Enter your name", text: $name)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    }
                    .padding(.horizontal, 30)
                    
                    // Phone Number TextField
                    VStack(alignment: .leading) {
                        Text("Phone number")
                            .font(.body)
                            .bold()
                        TextField("Enter your phone number", text: $phoneNumber)
                            .keyboardType(.phonePad)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    }
                    .padding(.horizontal, 30)
                    
                    // Send OTP Button
                    NavigationLink(destination: OTPView()) {
                        Text("SEND OTP")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
                .padding(.bottom, 50)
            }
            .ignoresSafeArea()
            .background(Color.white)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


#Preview {
    LoginView()
}
