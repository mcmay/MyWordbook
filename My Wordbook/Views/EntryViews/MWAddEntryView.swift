//
//  MWAddEntryView.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import SwiftUI
import SwiftData

struct MWAddEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State var expression: String = ""
    @State var definitions: [MWEntryDefinition] = []
    @State var showAddDefs: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Word/Phrase") {
                    MWAddExpressionTextField(expression: $expression)
                }
                
                Section("Definitions") {
                    MWDefSectionView(definitions: $definitions)
                }
            }
            .navigationTitle(Text("Add Word/Phrase"))
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
                    .disabled(expression.isEmpty)
                }
            }
        }
    }
    
    private func addEntry() {
        withAnimation {
            let newItem = MWEntry(word: "Word")
            modelContext.insert(newItem)
        }
    }
}

private struct MWDefSectionView: View {
    @Binding var definitions: [MWEntryDefinition]
    
    @State private var showAddDef: Bool = false
    @State private var showDefs: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                if definitions.isEmpty {
                    Text("No definitions yet. Add one now?")
                        .foregroundStyle(.secondary)
                } else {
                    Text(MWShared.singularOrPlural(number: definitions.count, singular: "definition", plural: "definitions"))
                        .font(.headline)
                        .bold()
                        .foregroundStyle(Color(.label))
                        .onTapGesture {
                            showDefs.toggle()
                        }
                }
                Spacer()
                Button {
                    showAddDef.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(.label))
                }
            }
            
            if showDefs {
                MWDefinitionsView(definitions: $definitions)
            }
        }
        .fullScreenCover(isPresented: $showAddDef) {
            MWAddDefinitionView()
        }
    }
}

private struct MWAddExpressionTextField: View {
    @Binding var expression: String
    @State private var addAlternative: Bool = false
    @State private var altSpelling: String = ""
    
    @FocusState private var exprFocus: Bool
    @FocusState private var altSpellingFocus: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField("Enter a word or phrase", text: $expression)
                .textFieldStyle(.roundedBorder)
                .focused($exprFocus)
                .textInputAutocapitalization(.never)
                .submitLabel(.done)
                .onAppear { exprFocus = true }
                .onSubmit { exprFocus = false }
            
            if addAlternative {
                TextField("Enter an alternative spelling", text: $altSpelling)
                    .textFieldStyle(.roundedBorder)
                    .focused($altSpellingFocus)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.done)
                    .onAppear {
                        altSpelling = expression
                        altSpellingFocus = true
                    }
            } else {
                Button("Alternative spelling") {
                    addAlternative.toggle()
                }
            }
        }
    }
}

#Preview {
    MWAddEntryView()
}
