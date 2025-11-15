//
//  MWEditableTextField.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import SwiftUI

struct MWEditableTextField: View {
    @Binding var text: String
    var placeholder: String
    @State private var isEditing: Bool = false
    @FocusState private var focused: Bool

    var body: some View {
        if isEditing {
            TextField(placeholder, text: $text)
                .textFieldStyle(.roundedBorder)
                .focused($focused)
                .submitLabel(.done)
                .onAppear { focused = true }
                .onSubmit { isEditing = false }
        } else {
            HStack {
                Text(text.isEmpty ? placeholder : text)
                Spacer()
                Button("Edit") { isEditing = true }
            }
        }
    }
}
