import SwiftUI
import MapKit

struct ListningDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    let listing : Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing:Listing){
        self.listing = listing
        
        let region = MKCoordinateRegion(center:listing.city == "Los Angeles" ? .losAngles : .miami,
                                        span:MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListningImageCourouselView(listing: listing)
                    .frame(height: 320)
                    .ignoresSafeArea(edges: .top)
                  
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background(
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        )
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(listing.title)")
                    .font(.headline)
                
                HStack {
                    Image(systemName: "star.fill")
                    Text(String(format: "%.1f", listing.rating))
                    Text("-")
                    Text("28 reviews")
                }
                .font(.caption)
                
                Text("\(listing.city), \(listing.state)")
                    .font(.footnote)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(listing.type) hosted by ")
                        .font(.headline)
                    Text("\(listing.ownerName)")
                        .font(.caption)
                    Text("\(listing.numberOfGuests) guest - \(listing.numberOfBedrooms)bedroom - \(listing.numberOfBeds)bed - \(listing.numberOfBathrooms)bath")
                        .font(.caption)
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
                
                Image("travell")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .padding(.trailing)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(listing.features) { feature in
                    HStack {
                        Image(systemName: feature.imageName)
                        VStack(alignment: .leading) {
                            Text("\(feature.title)")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("\(feature.subtitle)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                Text("\(listing.numberOfBedrooms) Bedrooms")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("What does this place offer?")
                    .font(.system(size: 18, weight: .bold))
                
                ForEach(listing.amenities) { amenity in
                    HStack {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        Text("\(amenity.title)")
                            .font(.footnote)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position:$cameraPosition)
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding()
        }
        .toolbar(.hidden,for: .tabBar)
        // ✅ Only apply padding for bottom safe area
        .padding(.bottom, 65)

        // ✅ Reserve bar overlay
        .overlay(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(listing.pricePerNight)")
                            .bold()
                        Text("Total before taxes")
                        Text("Oct 15 - 20")
                            .underline()
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button {
                        // Action
                    } label: {
                        Text("Reserve")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(Color.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 15)
                }
                .background(Color.white)
            }
        }
        .ignoresSafeArea()
    }
       
}

#Preview {
    ListningDetailView(listing: DeveloperPreview.shared.listings[2])
}
