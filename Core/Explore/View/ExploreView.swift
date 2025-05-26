//
//  ExploreView.swift
//  Airbnb
//
//  Created by Hemant Sonkusare on 23/05/25.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModal = ExploreViewModel(service: ExploreService())
    @State private var showDestinationSearchView: Bool = false;
   
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(
                    viewModal: viewModal,
                    show: $showDestinationSearchView
                )
                           .environmentObject(viewModal)
                       }
            else{
                ScrollView {
                    SearchAndFilterView(location: $viewModal.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32) {
                        ForEach(viewModal.listings, id: \.self) { listning in
                            NavigationLink(value: listning) {
                                ListingItemView(listing: listning)
                                    .frame(height: 410)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
//                .navigationTitle("Explore")
                
                // Move this here (inside NavigationStack, but outside ScrollView)
                .navigationDestination(for: Listing.self) { listing in
                    ListningDetailView(listing: listing)
                        .navigationBarBackButtonHidden(true)
    //                    .navigationBarTitleDisplayMode(.inline) // optional: controls nav bar title
                        .toolbar(.hidden, for: .navigationBar)
                }
            }
            
        }
    
    }
}

#Preview {
    ExploreView()
}
