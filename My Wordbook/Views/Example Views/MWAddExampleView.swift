//
//  MWAddExampleView.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import SwiftUI

struct MWAddExampleView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var examples: [MWSenseExample]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Example") {
                    
                }
            }
            .navigationTitle(Text("Add Example"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        dismiss()
                    }
                }
            }
        }
    }
}
