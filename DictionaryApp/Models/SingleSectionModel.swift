//
//  File.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 01.06.2023.
//

import Foundation

//class SingleSectionModel: Identifiable, ObservableObject {
//	let id = UUID()
//	var sectionName: String
//	var allSectionEntries = [SingleEntryModel(word: "Test word", translation: "Тест", masteryPercentage: .notPractised)]
//
//	init(sectionName: String, allSectionEntries: [SingleEntryModel] = [SingleEntryModel(word: "Test word", translation: "Тест", masteryPercentage: .notPractised)]) {
//		self.sectionName = sectionName
//		self.allSectionEntries = allSectionEntries
//	}
//
//	func deleteEntry(at offsets: IndexSet) {
//		print("deteled \(allSectionEntries)")
//		allSectionEntries.remove(atOffsets: offsets)
//	}
//}


struct SingleSectionModel: Identifiable {
	let id = UUID()
	var sectionName: String
	var allSectionEntries = [SingleEntryModel(word: "Test word 1", translation: "Тест", masteryPercentage: .notPractised),
													 SingleEntryModel(word: "Test word 2", translation: "Тест", masteryPercentage: .notPractised),
													 SingleEntryModel(word: "Test word 3", translation: "Тест", masteryPercentage: .notPractised),
													 SingleEntryModel(word: "Test word 4", translation: "Тест", masteryPercentage: .notPractised)]
	var isUsedForPractice: Bool 

	mutating func deleteEntry(at offsets: IndexSet) {
		print("deteled \(allSectionEntries)")
		allSectionEntries.remove(atOffsets: offsets)
	}
}

