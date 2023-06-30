//
//  File.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 01.06.2023.
//

import Foundation

struct SingleSectionModel: Identifiable {
	let id = UUID()
	var sectionName: String
	var allSectionEntries = [SingleEntryModel(word: "Test word 1", translation: "Тест 1", masteryPercentage: .notPractised),
													 SingleEntryModel(word: "Test word 2", translation: "Тест 2", masteryPercentage: .notPractised),
													 SingleEntryModel(word: "Test word 3", translation: "Тест 3", masteryPercentage: .notPractised),
													 SingleEntryModel(word: "Test word 4", translation: "Тест 4", masteryPercentage: .notPractised)]
	var isUsedForPractice: Bool 

	mutating func deleteEntry(at offsets: IndexSet) {
		print("deteled \(allSectionEntries)")
		allSectionEntries.remove(atOffsets: offsets)
	}
}

