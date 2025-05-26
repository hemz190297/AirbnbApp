//
//  ExploreService.swift
//  Airbnb1
//
//  Created by Hemant Sonkusare on 25/05/25.
//

import Foundation

class ExploreService {
    func fetchListning() async throws-> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
