//
//  CoverPhoto.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 04.05.2023.
//

import Foundation

// MARK: - CoverPhoto
struct CoverPhoto: Codable, Hashable {
    let id: Int
    let mediaURL: String
    let mediaType: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaURL = "media_url"
        case mediaType = "media_type"
    }
}
