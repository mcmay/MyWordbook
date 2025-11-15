//
//  MWAddSenseView.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import SwiftUI

struct MWAddSenseView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var senses: [MWDefinitionSense]
    
    @State private var sense: String = ""
    @State private var style: MWSenseStyle = .neutral
    @State private var translation: String = ""
    @State private var examples: [MWSenseExample] = []
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Meaning") {
                    TextEditor(text: $sense)
                }
                
                Section("Style") {
                    Picker("Style", selection: $style) {
                        ForEach(MWSenseStyle.allCases, id: \.self) { style in
                            Text(style.rawValue).tag(style)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section("Examples") {
                    MWExampleSectionView(examples: $examples)
                }
            }
            .navigationTitle(Text("Add Meaning"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        addSense()
                        dismiss()
                    }
                    .disabled(sense.isEmpty)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addSense() {
        let sense = MWDefinitionSense(sense: sense, style: style)
        senses.append(sense)
    }
}

private struct MWExampleSectionView: View {
    @Binding var examples: [MWSenseExample]
    
    @State private var showAddExample: Bool = false
    @State private var showExamples: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                if examples.isEmpty {
                    Text("No meanings yet. Add one now?")
                        .foregroundStyle(.secondary)
                } else {
                    Text(MWShared.singularOrPlural(number: examples.count, singular: "meaning", plural: "meanings"))
                        .font(.headline)
                        .bold()
                        .foregroundStyle(Color(.label))
                        .onTapGesture {
                            showExamples.toggle()
                        }
                }
                Spacer()
                Button {
                    showAddExample.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(.label))
                }
            }
            
            if showExamples {
                MWExamplesView(examples: $examples)
            }
        }
        .fullScreenCover(isPresented: $showAddExample) {
            MWAddExampleView(examples: $examples)
        }
    }
}

#Preview {
    MWAddSenseView(senses: .constant([]))
}
