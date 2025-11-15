//
//  MWShared.swift
//  My Wordbook
//
//  Created by Chao Mei on 15/11/2025.
//

struct MWShared {
    static func singularOrPlural(number: Int, singular: String, plural: String) -> String {
        "\(number) \(number > 1 ? plural : singular)"
    }
    
    static let definitions: [MWEntryDefinition] = [
        MWEntryDefinition(pos: "verb", pronunciation: "/ɪnˈdɛvə,ɛnˈdɛvə/"),
        MWEntryDefinition(pos: "noun", pronunciation: "/ɪnˈdɛvə,ɛnˈdɛvə/")
    ]
    
    static let demoEntry = MWEntry(word: "endeavour", entryDefinitions: definitions)

    static let demoEntries: [MWEntry] = [
        demoEntry,
        MWEntry(word: "contemplate", hidden: true, entryDefinitions: [
            MWEntryDefinition(pos: "verb", pronunciation: "/ˈkɒntɛmpleɪt/")
        ]),
        MWEntry(word: "resilient", priority: .medium, entryDefinitions: [
            MWEntryDefinition(pos: "adjective", pronunciation: "/rɪˈzɪljənt/")
        ]),
        MWEntry(word: "meticulous", priority: .medium, entryDefinitions: [
            MWEntryDefinition(pos: "adjective", pronunciation: "/məˈtɪkjʊləs/")
        ]),
        MWEntry(word: "advocate", priority: .veryLow, hidden: true, entryDefinitions: [
            MWEntryDefinition(pos: "verb", pronunciation: "/ˈædvəkeɪt/"),
            MWEntryDefinition(pos: "noun", pronunciation: "/ˈædvəkət/")
        ]),
        MWEntry(word: "convey", priority: .veryLow, hidden: true, entryDefinitions: [
            MWEntryDefinition(pos: "verb", pronunciation: "/kənˈveɪ/")
        ]),
        MWEntry(word: "premise", priority: .medium, entryDefinitions: [
            MWEntryDefinition(pos: "noun", pronunciation: "/ˈprɛmɪs/")
        ]),
        MWEntry(word: "discern", priority: .veryLow, entryDefinitions: [
            MWEntryDefinition(pos: "verb", pronunciation: "/dɪˈsɜːn/")
        ]),
        MWEntry(word: "formidable", priority: .veryLow, entryDefinitions: [
            MWEntryDefinition(pos: "adjective", pronunciation: "/ˈfɔːmɪdəbəl, fɔːˈmɪdəbəl/")
        ]),
        MWEntry(word: "surmise", priority: .medium, entryDefinitions: [
            MWEntryDefinition(pos: "verb", pronunciation: "/səˈmaɪz/"),
            MWEntryDefinition(pos: "noun", pronunciation: "/ˈsɜːmaɪz/")
        ]),
        MWEntry(word: "invoke", priority: .low, hidden: true, entryDefinitions: [
            MWEntryDefinition(pos: "verb", pronunciation: "/ɪnˈvəʊk/")
        ])
    ]
}

