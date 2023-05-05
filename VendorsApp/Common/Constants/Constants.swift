//
//  Constants.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 26.04.2023.
//

import SwiftUI

// MARK: - Constants
struct Constants {
    
    // MARK: - Fonts
    struct Fonts {
        static func bold(size: CGFloat = 16) -> Font {
            Font.custom("OpenSans-Bold", size: size)
        }
        
        static func regular(size: CGFloat = 14) -> Font {
            Font.custom("OpenSans-Regular", size: size)
        }
    }
    
    // MARK: - Vendors
    struct Vendors {
        static var noResultTitle = "Sorry! No results found..."
        static var noResultDescription = "Please try a different search request\nor browse businesses from the list"
    }
    
    // MARK: - SearchBar
    struct SearchBar {
        static let placeholder = "Search..."
    }
}
