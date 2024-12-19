//
//  OTPView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 01/10/24.
//

import SwiftUI

struct OTPView: View {
    @State private var otp: [String] = ["", "", "", ""]
    @State private var isOTPVerified = false // To trigger navigation after verification

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
                    
                    // Verification Text
                    Text("We have sent a verification code on your phone number.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .foregroundColor(.black)
                    
                    // OTP Fields
                    HStack(spacing: 15) {
                        ForEach(0..<4, id: \.self) { index in
                            TextField("", text: Binding(
                                get: { otp[index] },
                                set: { newValue in
                                    if newValue.count <= 1 {
                                        otp[index] = newValue
                                    }
                                })
                            )
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1))
                        }
                    }
                    
                    // Verify Button
                    Button(action: {
                        // Simulate OTP verification process
                        verifyOTP()
                    }) {
                        Text("Verify")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 30)
                    
                    // Resend OTP Option
                    HStack {
                        Text("Didn't receive OTP?")
                        Button(action: {
                            // Resend OTP action
                        }) {
                            Text("Resend OTP")
                                .bold()
                        }
                    }
                    .foregroundColor(.black)
                }
                .padding(.bottom, 50)
            }
            .ignoresSafeArea()
            .background(Color.white)
            .navigationDestination(isPresented: $isOTPVerified) {
                DashboardView() // Navigate to DashboardView when OTP is verified
            }
        }
    }

    func verifyOTP() {
        // Simulate OTP verification logic here
        // Assuming OTP is correct, set isOTPVerified to true
        if otp == ["3", "7", "2", "5"] { // Replace with your actual OTP validation logic
            isOTPVerified = true
        } else {
            // Show an error or retry logic here
            print("Incorrect OTP")
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}


#Preview {
    OTPView()
}
