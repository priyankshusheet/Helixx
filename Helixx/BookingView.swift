//
//  BookingView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 03/10/24.
//

import SwiftUI

struct BookingView: View {
    var totalAmount: Double = 1500.0 // Example total amount for the booking
    
    var body: some View {
        VStack {
            // Your booking details and UI here
            
            Spacer()
            
            // Book Now button
            NavigationLink(destination: PaymentView(totalAmount: totalAmount)) {
                Text("Book Now")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
        }
        .navigationTitle("Booking")
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookingView()
        }
    }
}

#Preview {
    BookingView()
}
