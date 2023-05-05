//
//  VendorsAppApp.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 26.04.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSVGCoder

@main
struct VendorsAppApp: App {
    
    init() {
        setUpDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            VendorsView()
        }
    }
}

private extension VendorsAppApp {
    func setUpDependencies() {
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
}
