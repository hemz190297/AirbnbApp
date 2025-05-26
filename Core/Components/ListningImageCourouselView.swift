//
//  ListningImageCourouselView.swift
//  Airbnb1
//
//  Created by Hemant Sonkusare on 23/05/25.
//

import SwiftUI

struct ListningImageCourouselView: View {
    let listing: Listing

    var body: some View {
        TabView {
            ForEach(listing.imageUrls, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                   
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListningImageCourouselView(listing: DeveloperPreview.shared.listings[0])
}
