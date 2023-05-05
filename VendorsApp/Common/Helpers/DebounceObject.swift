//
//  DebounceObject.swift
//  VendorsApp
//
//  Created by Savka Mykhailo on 04.05.2023.
//

import SwiftUI
import Combine

// MARK: - DebounceObject
public final class DebounceObject: ObservableObject {
    
    // MARK: - Published
    @Published var text: String = ""
    @Published var debouncedText: String = ""
    
    // MARK: - Private properties
    private var bag = Set<AnyCancellable>()
    
    // MARK: - Lifecycle
    public init(dueTime: TimeInterval = 0.5) {
        $text
            .removeDuplicates()
            .debounce(for: .seconds(dueTime), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] value in
                self?.debouncedText = value
            })
            .store(in: &bag)
    }
}
