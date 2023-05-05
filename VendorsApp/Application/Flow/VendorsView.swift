//
//  VendorsView.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 03.05.2023.
//

import SwiftUI

// MARK: - VendorsView
struct VendorsView: View {
    
    // MARK: - ObservedObjects
    @ObservedObject private var vendorsViewModel = VendorsViewModel()
    
    // MARK: - Views
    private var scrollView: some View {
        ScrollView {
            ForEach(vendorsViewModel.filteredVendors()) { vendor in
                VendorView(isSaved: vendor.favorited,
                           categories: vendor.categories,
                           tags: vendor.tags,
                           areaServed: vendor.areaServed,
                           companyName: vendor.companyName,
                           url: vendor.coverPhoto.mediaURL)
            }
        }
        .padding(.bottom, 5)
    }
    
    private var noResultsVStack: some View {
        VStack {
            Spacer()
            Text(Constants.Vendors.noResultTitle)
                .font(Constants.Fonts.bold(size: 24))
                .foregroundColor(Color("Dark Green"))
            Text(Constants.Vendors.noResultDescription)
                .font(Constants.Fonts.regular(size: 16))
                .foregroundColor(Color("Primary Grey"))
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    SearchBarView(searchQuery: $vendorsViewModel.searchQuery)
                    if vendorsViewModel.filteredVendors().count > 0 {
                        scrollView
                    } else {
                        noResultsVStack
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct VendorsView_Previews: PreviewProvider {
    static var previews: some View {
        VendorsView()
    }
}
