//
//  VendorsViewModel.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 03.05.2023.
//

import SwiftUI

// MARK: - VendorsViewModel
class VendorsViewModel: ObservableObject {
    
    // MARK: - Published
    @Published var searchQuery = ""
    @Published var dataManager = DataManager()
    
    // MARK: - Public methods
    func filteredVendors() -> [Vendor] {
        return dataManager.vendors.filter { $0.companyName.contains(searchQuery) || searchQuery.isEmpty }
    }
}
