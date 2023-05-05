//
//  CategoryLayout.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 04.05.2023.
//

import SwiftUI

// MARK: - CategoryLayout
struct CategoryLayout: Layout {
    
    // MARK: - Private properties
    private let spacing: CGFloat
    
    // MARK: - Lifecycle
    init(spacing: CGFloat = 8) {
        self.spacing = spacing
    }
    
    // MARK: - Public methods
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let sizes = subviews.map { $0.sizeThatFits(proposal) }
        let maxViewHeight = sizes.map { $0.height }.max() ?? 0
        var currentRowWidth: CGFloat = 0
        var totalHeight: CGFloat = maxViewHeight
        var totalWidth: CGFloat = 0
        
        for size in sizes {
            if currentRowWidth + spacing + size.width > proposal.width ?? 0 {
                totalHeight += spacing + maxViewHeight
                currentRowWidth = size.width
            } else {
                currentRowWidth += spacing + size.width
            }
            totalWidth = max(totalWidth, currentRowWidth)
        }
        return CGSize(width: totalWidth, height: totalHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = subviews.map { $0.sizeThatFits(proposal) }
        let maxViewHeight = sizes.map { $0.height }.max() ?? 0
        var point = CGPoint(x: bounds.minX, y: bounds.minY)
        for index in subviews.indices {
            if point.x + sizes[index].width > bounds.maxX {
                point.x = bounds.minX
                point.y += maxViewHeight + spacing
            }
            subviews[index].place(at: point, proposal: ProposedViewSize(sizes[index]))
            point.x += sizes[index].width + spacing
        }
    }
}