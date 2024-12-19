//
//  PaymentView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 03/10/24.
//

import SwiftUI

struct PaymentView: View {
    var totalAmount: Double // Pass the total amount to this view
    
    var body: some View {
        VStack {
            Text("Payment")
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            
            // Bank offers section
            VStack(alignment: .leading) {
                Text("Bank offers")
                    .font(.headline)
                    .padding(.top, 10)
                
                Text("10% instant discount on SBI credit cards")
                    .font(.body)
                
                Text("View all(3)")
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            
            // Payment Option section
            Section {
                Text("Payment Option")
                    .font(.headline)
                    .padding(.top, 10)
                
                PaymentOptionButton(title: "Google Pay", iconName: "google-pay")
                PaymentOptionButton(title: "PhonePe", iconName: "phonepe")
                PaymentOptionButton(title: "Paytm", iconName: "paytm")
            }
            .padding(.horizontal)
            
            // Credit & Debit Card section
            Section {
                Text("Credit & Debit Card")
                    .font(.headline)
                    .padding(.top, 10)
                
                HStack {
                    Image(systemName: "plus.circle")
                    Text("Add New Card")
                        .font(.body)
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // More Payment Options section
            Section {
                Text("More Payment Options")
                    .font(.headline)
                    .padding(.top, 10)
                
                PaymentOptionButton(title: "Netbanking", iconName: "bank")
                PaymentOptionButton(title: "UPI ID", iconName: "upi")
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Pay button with total amount
            Button(action: {
                // Payment action
                print("Payment of \(totalAmount) initiated")
            }) {
                Text("Pay ₹ \(totalAmount, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
        }
    }
}

struct PaymentOptionButton: View {
    var title: String
    var iconName: String
    
    var body: some View {
        HStack {
            Image(iconName)
                .resizable()
                .frame(width: 30, height: 30)
            Text(title)
                .font(.body)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(totalAmount: 1500.0)
    }
}
