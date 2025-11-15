//
//  MWEntrySense.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import Foundation
import SwiftData

@Model
final class MWDefinitionSense: Identifiable {
    var id: UUID = UUID()
    var sense: String
    var translation: String?
    var style: MWSenseStyle
    var imageURL: URL?
    
    @Relationship(deleteRule: .cascade) var examples: [MWSenseExample]?
    @Relationship(deleteRule: .nullify, inverse: \MWEntryDefinition.definitionSenses) var definition: MWEntryDefinition?
    
    init(sense: String, translation: String? = nil, style: MWSenseStyle = .neutral, imageURL: URL? = nil) {
        self.sense = sense
        self.translation = translation
        self.style = style
        self.imageURL = imageURL
    }
}

enum MWSenseStyle: String, Codable, CaseIterable {
    case neutral, formal, informal
}
