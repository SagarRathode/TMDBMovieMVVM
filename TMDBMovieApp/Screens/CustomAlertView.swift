//
//  CustomAlertView.swift
//  TheProfile
//
//  Created by Sagar Rathode   on 12/06/25.
//
import SwiftUI
// MARK: - Custom Alert View
struct CustomAlertView: View {
    let title: String
    let message: String
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)

            Text(message)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Button(action: onDismiss) {
                Text("OK")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    //.background(LinearGradient(colors: [.blue, .green], startPoint: .leading, endPoint: .trailing))
                    .background(LinearGradient(colors: [.blue,.black], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(width: 300)
        .background(
            LinearGradient(colors: [Color.blue.opacity(0.9), Color.purple.opacity(0.8)], startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(20)
        .shadow(radius: 20)
        
    }
}
