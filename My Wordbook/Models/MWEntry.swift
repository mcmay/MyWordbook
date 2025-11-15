//
//  Item.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import Foundation
import SwiftData

@Model
final class MWEntry: Identifiable {
    var id: UUID = UUID()
    var createdAt: Date
    var updatedAt: Date?
    var word: String
    var priority: MWEntryPriority
    
    init(createdAt: Date = Date(), word: String, priority: MWEntryPriority = .low) {
        self.createdAt = createdAt
        self.word = word
        self.priority = priority
    }
    
    @Relationship(deleteRule: .cascade) var entryDetail: [MWEntryDetail] = []
}

enum MWEntryPriority: Int, Codable {
    case low, medium, high
}
