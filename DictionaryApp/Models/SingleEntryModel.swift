//
//  SingleEntry.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 31.05.2023.
//

import Foundation

struct SingleEntryModel: Identifiable {
	let id = UUID()
	var word: String
	var translation: String
	var masteryPercentage: MasteryPercentage
//	var sectionName: String
}

enum MasteryPercentage: Int {
	case notPractised = 0
	case practisedOneTime = 25
	case practisedTwoTimes = 50
	case practisedThreeTimes = 75
	case practisedFourTimes = 100
}
