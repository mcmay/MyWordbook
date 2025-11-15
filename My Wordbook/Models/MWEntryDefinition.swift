//
//  MWMeaning.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import Foundation
import SwiftData

@Model
final class MWEntryDefinition: Identifiable {
    var id: UUID = UUID()
    var pos: String
    var pronunciation: String
    
    @Relationship(deleteRule: .nullify, inverse: \MWEntry.entryDefinitions) var entry: MWEntry?
    @Relationship(deleteRule: .cascade) var definitionSenses: [MWDefinitionSense]?
    
    init(pos: String, pronunciation: String) {
        self.pos = pos
        self.pronunciation = pronunciation
    }
}
