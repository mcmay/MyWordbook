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
    var pos: String = ""
    var pronunciation: String = ""
    
    init() {
    
    }
}
