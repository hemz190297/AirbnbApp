//
//  ListingView.swift
//  Airbnb
//
//  Created by Hemant Sonkusare on 23/05/25.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 8) {
            
            // Image Carousel
            ListningImageCourouselView(listing: listing)
                .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // Listing Details
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(listing.city), \(listing.state)")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text("2 guests · 1 bedroom · 1 bed · 1 bath")
                        .foregroundStyle(.gray)
                    
                    Text("Hosted by Hemant")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                            .foregroundStyle(.gray)
                    }
                }
                Spacer()
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                    
                    Text(String(format: "%.1f", listing.rating))
                }
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
