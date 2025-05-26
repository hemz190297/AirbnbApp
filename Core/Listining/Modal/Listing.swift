//
//  Listing.swift
//  Airbnb1
//
//  Created by Hemant Sonkusare on 25/05/25.
//

import Foundation

struct Listing: Identifiable,Codable,Hashable {
    let id:String
    let ownerUid:String
    let ownerName:String
    let ownnerImageUrl:String
    let numberOfBedrooms:Int
    let numberOfBathrooms:Int
    let numberOfGuests:Int
    let numberOfBeds:Int
    var pricePerNight:Int
    let latitude:Double
    let longitude:Double
    let imageUrls:[String]
    let address:String
    let city:String
    let state:String
    let title:String
    let rating:Double
    var features:[ListingFeatures]
    var amenities:[ListingAmenities]
    let type:ListingType    
}

enum ListingFeatures:Int,Codable,Identifiable,Hashable {
    case selfCheckin
    case superhost
    
    var imageName:String{
        switch self {
        case .selfCheckin:
            return "door.left.hand.open"
        case .superhost:
            return "medal"
        }
    }
    
    var title:String{
        switch self {
        case .selfCheckin:
            return "Self Check-in"
        case .superhost:
            return "Superhost"
        }
    }
    
    var subtitle:String{
        switch self {
        case .selfCheckin:
            return "Check yourself in with the keypad"
        case .superhost:
            return "Superhost are experienced, highly rated hosts who are combined to providing greate stars for guests"
        }
    }
    
    var id:Int{
        self.rawValue
    }
}


enum ListingAmenities:Int,Codable,Identifiable,Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
  
    var title:String{
        switch self {
        case .pool:
            return "Pool"
        case .kitchen:
            return "Kitchen"
        case .wifi:
            return "Wifi"
        case .laundry:
            return "Laundry"
            case .tv:
            return "Tv"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        }
    }
    
    var imageName:String{
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .kitchen:
            return "fork.knife"
        case .wifi:
            return "wifi"
        case .laundry:
            return "washer"
            case .tv:
            return "tv"
        case .alarmSystem:
            return "lock.icloud"
        case .office:
            return "lock.shield"
        case .balcony:
            return "building"
        }
    }
    var id: Int{
        self.rawValue
    }
    
}


enum ListingType:Int,Codable,Identifiable,Hashable {
    case apartment
    case house
    case townhouse
    case villa
    
    var title:String{
        switch self {
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .townhouse:
            return "Townhouse"
        case .villa:
            return "Villa"
        }
    }
    var id:Int{
         self.rawValue
    }
}

