//
//  CoverPhotoView.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 03.05.2023.
//

import SwiftUI

// MARK: - CoverPhotoView
struct CoverPhotoView: View {
    
    // MARK: - Binding
    @Binding var isSaved: Bool
    
    // MARK: - Public properties
    var url: String
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: url), content: { image in
                image.resizable()
            }, placeholder: {
                Color.clear
            })
            .aspectRatio(contentMode: .fill)
            .frame(height: 170)
            .cornerRadius(10)
            HStack {
                Spacer()
                Button(action: {
                    isSaved.toggle()
                }, label: {
                    Image(isSaved ? "saveIconActive" : "saveIconInactive")
                })
                .frame(width: 36, height: 36)
                .padding([.trailing, .top], 10)
            }
        }
    }
}
