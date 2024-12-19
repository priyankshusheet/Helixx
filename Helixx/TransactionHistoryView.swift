//
//  TransactionHistoryView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 03/10/24.
//

import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let method: String
    let amount: String
}

struct TransactionHistoryView: View {
    // Mock data for transactions
    let upcomingPayment = Transaction(title: "Lorem Ipsum", date: "4 Jun' 24", method: "UPI", amount: "Pay Now")
    
    let pastPayments = [
        Transaction(title: "Lorem Ipsum", date: "4 Jun' 24", method: "UPI", amount: "₹12,000"),
        Transaction(title: "Lorem Ipsum", date: "4 Jun' 24", method: "UPI", amount: "₹2,000"),
        Transaction(title: "Lorem Ipsum", date: "4 Jun' 24", method: "UPI", amount: "₹1,500"),
        Transaction(title: "Lorem Ipsum", date: "4 Jun' 24", method: "UPI", amount: "₹150"),
        Transaction(title: "Lorem Ipsum", date: "4 Jun' 24", method: "UPI", amount: "₹1,130")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Upcoming Payment Section
                    Text("Upcoming Payment")
                        .font(.headline)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Payment Type")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text(upcomingPayment.title)
                                .font(.subheadline)
                            
                            Text("Due Date")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text(upcomingPayment.date)
                                .font(.subheadline)
                        }
                        Spacer()
                        
                        // Pay Now Button
                        Button(action: {
                            print("Pay Now tapped")
                        }) {
                            Text(upcomingPayment.amount)
                                .font(.headline)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    
                    // Past Payments Section
                    Text("Past Payment")
                        .font(.headline)
                    
                    ForEach(pastPayments) { transaction in
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(transaction.title)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                
                                HStack(spacing: 5) {
                                    Text(transaction.date)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Text("|")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Text(transaction.method)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            Spacer()
                            Text(transaction.amount)
                                .font(.headline)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .navigationTitle("Transactions History")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView()
    }
}


#Preview {
    TransactionHistoryView()
}
