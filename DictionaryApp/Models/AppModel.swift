//
//  AppModel.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 31.05.2023.
//

import Foundation
import SwiftUI

class AppModel: ObservableObject {	
	@Published var allSections = [SingleSectionModel(sectionName: "All words 1", isUsedForPractice: false),
																SingleSectionModel(sectionName: "All words 2", isUsedForPractice: false),
																SingleSectionModel(sectionName: "All words 3", isUsedForPractice: false),
																SingleSectionModel(sectionName: "All words 4", isUsedForPractice: false)]
//	@Published var allSections = [SingleSectionModel(sectionName: "All words")]
	
	@Published var sectionsForPractice = [SingleSectionModel]()
	
	func deleteSection(at index: Int) {
		self.allSections.remove(at: index)
	}
	
	var sectionsNames: [String] {
		let allNames = allSections.map { section in
			 section.sectionName
		}
		
		return allNames
	}
	
}
