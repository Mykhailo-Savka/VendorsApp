//
//  Category.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 04.05.2023.
//

import Foundation

// MARK: - Category
struct Category: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let image: CoverPhoto
}
