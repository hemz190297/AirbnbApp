//
//  ProfileView.swift
//  Airbnb1
//
//  Created by Hemant Sonkusare on 24/05/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading,spacing:4){
            VStack(alignment: .leading, spacing: 4){
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Login into start planning your next trip.")
            }
            .padding(.horizontal, 16)
      
            
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
            
            VStack {
                Text("Don't have an account? Sign up.")
                    .foregroundColor(.gray)
                    .font(.caption)
                    .padding(32)
            }
                
            VStack {
                ExtractedView( image1: "gearshape",title: "Settings", image2: "chevron.right")
            }
            Divider()
            ExtractedView( image1: "figure.roll",title: "Accessibility", image2: "chevron.right")
            Divider()
            ExtractedView( image1: "questionmark.circle",title: "Visit The Help Center", image2: "chevron.right")
            Divider()
        }
    }
}

#Preview {
    ProfileView()
}

struct ExtractedView: View {
    let image1: String
    let title: String
    let image2: String

    var body: some View {
        HStack{
            Button {
                
            }
            label: {
                Image(systemName: image1)
                Text(title)
                Spacer()
                Image(systemName: image2)
            }
          
        }
        .padding(.horizontal, 16)
        .padding(.vertical)
    }
}
