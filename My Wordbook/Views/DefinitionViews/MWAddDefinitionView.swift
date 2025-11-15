//
//  MWAddDefinitionsView.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import SwiftUI
import SwiftData

struct MWAddDefinitionView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var pronunciation: String = ""
    @State private var pos: String = ""
    @State private var senses: [MWDefinitionSense] = []
    
    @FocusState private var pronunciationFocus: Bool
    @FocusState private var posFocus: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pronunciation (Optional)")) {
                    TextField("Enter pronunciation", text: $pronunciation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .focused($pronunciationFocus)
                        .onAppear {
                            pronunciationFocus = true
                        }
                        .submitLabel(.done)
                        .onSubmit {
                            posFocus = true
                        }
                }
                
                Section(header: Text("Part of speech (Optional)")) {
                    TextField("Enter part of speech", text: $pos)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .focused($posFocus)
                        .submitLabel(.done)
                }
                
                Section(header: Text("Meaning")) {
                    MWMeaningSectionView(senses: $senses)
                }
            }
            .navigationTitle(Text("Add Definition"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        addDefinition()
                        dismiss()
                    }
                    .disabled(false)
                }
            }
        }
    }
    
    private func addDefinition() {
        
    }
}


private struct MWMeaningSectionView: View {
    @Binding var senses: [MWDefinitionSense]
    
    @State private var showAddSense: Bool = false
    @State private var showSenses: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                if senses.isEmpty {
                    Text("No meanings yet. Add one now?")
                        .foregroundStyle(.secondary)
                } else {
                    Text(MWShared.singularOrPlural(number: senses.count, singular: "meaning", plural: "meanings"))
                        .font(.headline)
                        .bold()
                        .foregroundStyle(Color(.label))
                        .onTapGesture {
                            showSenses.toggle()
                        }
                }
                Spacer()
                Button {
                    showAddSense.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(.label))
                }
            }
            
            if showSenses {
                MWSensesView(senses: $senses)
            }
        }
        .fullScreenCover(isPresented: $showAddSense) {
            MWAddSenseView(senses: $senses)
        }
    }
}

#Preview {
    MWAddDefinitionView()
}
