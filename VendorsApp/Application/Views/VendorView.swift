//
//  VendorView.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 03.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - VendorView
struct VendorView: View {
    
    // MARK: - State
    @State var isSaved: Bool
    
    // MARK: - Public properties
    var categories: [Category]
    var tags: [Tag]
    var areaServed: String
    var companyName: String
    var url: String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                CoverPhotoView(isSaved: $isSaved, url: url)
                HStack {
                    Text(areaServed)
                        .frame(height: 22)
                        .font(Constants.Fonts.regular())
                        .foregroundColor(Color("Primary Grey"))
                        .padding([.leading, .trailing], 8)
                        .background(Color(.white))
                        .cornerRadius(16)
                        .padding([.leading, .bottom], 8)
                    Spacer()
                }
            }
            Text(companyName)
                .frame(height: 22)
                .font(Constants.Fonts.bold())
                .foregroundColor(Color("Primary Grey"))
                .padding([.top, .bottom], 10)
            CategoryLayout {
                ForEach(categories) { category in
                    HStack {
                        WebImage(url: URL(string: category.image.mediaURL))
                            .resizable()
                            .frame(width: 22, height: 22)
                        Text(category.name)
                            .font(Constants.Fonts.regular())
                            .foregroundColor(Color("Primary Grey"))
                            .frame(height: 18)
                            .padding(.trailing, 14)
                    }
                }
            }
            Text(configureTagsString(tags: tags))
                .font(Constants.Fonts.regular())
                .foregroundColor(Color("Secondary Grey"))
                .padding(.top, 8)
        }
        .padding([.leading, .trailing, .bottom], 16)
    }
    
    // MARK: - Private methods
    private func configureTagsString(tags: [Tag]) -> String {
        let modifiedTags = tags.map( { "• " + $0.name } )
        return modifiedTags.joined(separator: " ")
    }
}
