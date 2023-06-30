//
//  AppModel.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 31.05.2023.
//

import Foundation
import SwiftUI

class AppModel: ObservableObject {	
	@Published var allSections = [SingleSectionModel(sectionName: "Denis", isUsedForPractice: false),
																SingleSectionModel(sectionName: "Kate", isUsedForPractice: false),
																SingleSectionModel(sectionName: "Cocos", isUsedForPractice: false)]
	
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
