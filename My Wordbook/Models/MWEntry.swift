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
    var altSpelling: String?
    var priority: MWEntryPriority
    var hidden: Bool
    
    init(createdAt: Date = Date(),
         word: String,
         altSpelling: String? = nil,
         priority: MWEntryPriority = .veryLow,
         hidden: Bool = false,
         entryDefinitions: [MWEntryDefinition] = []
    ) {
        self.createdAt = createdAt
        self.word = word
        self.altSpelling = altSpelling
        self.priority = priority
        self.hidden = hidden
        self.entryDefinitions = entryDefinitions
    }
    
    @Relationship(deleteRule: .cascade) var entryDefinitions: [MWEntryDefinition]
}

enum MWEntryPriority: String, Codable {
    case veryLow = "Very low"
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case veryHigh = "Very high"
}
