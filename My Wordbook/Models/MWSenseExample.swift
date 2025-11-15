//
//  MWExample.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import Foundation
import SwiftData

@Model
final class MWSenseExample: Identifiable {
    var id: UUID = UUID()
    var headword: String
    var translation: String?
    var source: String?
    
    init(headword: String = "") {
        self.headword = headword
    }
    
    @Relationship(deleteRule: .nullify, inverse: \MWDefinitionSense.examples) var sense: MWDefinitionSense?
}
