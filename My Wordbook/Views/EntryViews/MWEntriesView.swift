//
//  ContentView.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

import SwiftUI
import SwiftData

struct MWEntriesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var entries: [MWEntry]
    
    @State private var showAddEntrySheet: Bool = false

    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading) {
                Text(MWShared.singularOrPlural(number: entries.count, singular: "word", plural: "words"))
                    .font(.title2)
                    .bold()
                    .padding()
                List {
                    ForEach(entries) { entry in
                        NavigationLink {
                            Text("\(entry.word) \(entry.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        } label: {
                            MWEntryListCell(entry: entry)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("My Wordbook")
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button{
                        showAddEntrySheet.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .fullScreenCover(isPresented: $showAddEntrySheet) {
                MWAddEntryView()
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(entries[index])
            }
        }
    }
}

#Preview {
    // Create an in-memory container
    let container = try! ModelContainer(
        for: MWEntry.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )

    // Insert some dummy categories into the context
    let context = container.mainContext
    
    MWShared.demoEntries.forEach { context.insert($0) }

    
    return MWEntriesView()
        .modelContainer(container)
}
