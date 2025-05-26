//
//  WsihListView.swift
//  Airbnb1
//
//  Created by Hemant Sonkusare on 25/05/25.
//

import SwiftUI

struct WsihListView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading,spacing: 32) {
                VStack(alignment: .leading) {
                    Text("Log in to view your wishlist.")
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Text("You can create, view or edit wishlists once you've logged in.")
                        .font(.footnote)
                        .fontWeight(.medium)
                }
            }
            
            VStack {
                Button {
                    // Action
                } label: {
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 380, height: 40)
                        .background(Color.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.horizontal, 16)
                .padding(.top, 15)
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WsihListView()
}
