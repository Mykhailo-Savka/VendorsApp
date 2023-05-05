//
//  DataManager.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 04.05.2023.
//

import Foundation

// MARK: - DataManager
class DataManager: ObservableObject {
    
    // MARK: - Published
    @Published var vendors = [Vendor]()
    
    // MARK: - Lifecycle
    init() {
        loadData()
    }
    
    // MARK: - Public methods
    func loadData() {
        guard let url = Bundle.main.url(forResource: "vendors", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return }
        do {
            let response = try JSONDecoder().decode(Vendors.self, from: data)
            self.vendors = response.vendors
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
