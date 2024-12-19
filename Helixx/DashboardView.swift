//
//  ContentView.swift
//  Helixx
//
//  Created by Priyankshu Sheet on 01/10/24.
//

import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                NavigationLink(destination: HospitalListView()) {}
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Describe the condition", text: .constant(""))
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .padding(.horizontal)
                
                Text("Good Morning, John!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                HStack {
                    CircularProgressBar(progress: 0.74) // Assuming this is 74%
                        .frame(width: 160, height: 160)
                    Spacer()
                    VStack(spacing: 15) {
                        StatusButton(icon: "pencil", label: "Lorem Ipsum", color: .green)
                        StatusButton(icon: "pencil", label: "Lorem Ipsum", color: .red)
                        StatusButton(icon: "pencil", label: "Lorem Ipsum", color: .blue)
                    }
                    .padding(.trailing)
                }
                .padding(.horizontal)
                
                Text("Doctor's Recommendations")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                VStack(spacing: 10) {
                    ForEach(0..<5) { _ in
                        Text("Lorem ipsum odor amet, consectetur adipiscing...")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct StatusButton: View {
    var icon: String
    var label: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .padding(8)
                .background(color)
                .cornerRadius(10)
            Text(label)
                .font(.body)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
    }
}

struct CircularProgressBar: View {
    var progress: Double
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 1.0)
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(.gray)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(self.progress > 0.75 ? .red : (self.progress > 0.5 ? .yellow : .green))
                .rotationEffect(Angle(degrees: 270.0))
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.largeTitle)
                .bold()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}


#Preview {
    DashboardView()
}
