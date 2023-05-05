//
//  SearchBarView.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 03.05.2023.
//

import SwiftUI

// MARK: - SearchBarView
struct SearchBarView: View {
    
    // MARK: - Binding
    @Binding var searchQuery: String
    
    // MARK: - StateObject
    @StateObject var debounceObject = DebounceObject()
    
    // MARK: - Body
    var body: some View {
        HStack {
            TextField(Constants.SearchBar.placeholder, text: $debounceObject.text)
                .onChange(of: debounceObject.debouncedText) { value in
                    if value.count < 3 {
                        withAnimation {
                            searchQuery = ""
                        }
                    } else {
                        withAnimation {
                            searchQuery = String(value)
                        }
                    }
                }
                .font(Constants.Fonts.regular(size: 16))
                .foregroundColor(Color("Secondary Grey"))
                .padding(.leading, 8)
            Image("searchIcon")
                .padding(.trailing, 8)
        }
        .frame(height: 40)
        .background(.white)
        .cornerRadius(16)
        .padding([.leading, .trailing], 16)
        .shadow(color: Color("Shadow"), radius: 14, y: 6)
    }
}
