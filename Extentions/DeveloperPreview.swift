//
//  DeveloperPreview.swift
//  Airbnb1
//
//  Created by Hemant Sonkusare on 25/05/25.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    var listings: [Listing] = [
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            ownerName: "Hemant Sonkusare",
            ownnerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 4,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 600,
            latitude: 25.7869,
            longitude: -84.3127,
            imageUrls: ["travell","worldTravell",  "buddy-photo-omxwwtNse3k-unsplash","balloons"],
            address: "12345 Main Street",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckin, .superhost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            ownerName: "Ayush Khade",
            ownnerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 28.7869,
            longitude: -84.6876,
            imageUrls: ["buddy-photo-omxwwtNse3k-unsplash","worldTravell", "travell","balloons"],
            address: "12345 Main Street",
            city: "California",
            state: "Florida",
            title: "Beautiful California apartment in the heart of the city",
            rating: 4.66,
            features: [.selfCheckin, .superhost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            ownerName: "Pika-Chiu",
            ownnerImageUrl: "male-profile-photo",
            numberOfBedrooms: 3,
            numberOfBathrooms: 2,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 400,
            latitude: 22.7869,
            longitude: -94.88,
            imageUrls: ["balloons","worldTravell", "travell", "buddy-photo-omxwwtNse3k-unsplash"],
            address: "12345 Main Street",
            city: "Los Angeles",
            state: "Florida",
            title: "Beautiful los angeles apartment in the liver of the city",
            rating: 4.99,
            features: [.selfCheckin, .superhost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),

    ]
}


