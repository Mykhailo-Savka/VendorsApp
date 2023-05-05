//
//  Vendor.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 04.05.2023.
//

import Foundation

// MARK: - Vendor
struct Vendor: Codable, Identifiable {
    let id: Int
    let companyName: String
    let areaServed: String
    let shopType: String
    let favorited, follow: Bool
    let businessType: String
    let coverPhoto: CoverPhoto
    let categories: [Category]
    let tags: [Tag]
    
    enum CodingKeys: String, CodingKey {
        case id
        case companyName = "company_name"
        case areaServed = "area_served"
        case shopType = "shop_type"
        case favorited, follow
        case businessType = "business_type"
        case coverPhoto = "cover_photo"
        case categories, tags
    }
}
