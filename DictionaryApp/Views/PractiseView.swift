//
//  PractiseView.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 31.05.2023.
//

import SwiftUI

struct PractiseView: View {
	@Environment(\.dismiss) var dismiss
	@ObservedObject var appModel: AppModel
	@State private var sectionsForPractice: [SingleSectionModel] = [SingleSectionModel]()
	
	
    var body: some View {
			NavigationStack {
				List {
					ForEach($appModel.allSections) { $section in
						HStack {
							Image(systemName: section.isUsedForPractice ? "checkmark.square" : "square")
							Text(section.sectionName)
						}
						.onTapGesture {
							if !section.isUsedForPractice {
								section.isUsedForPractice = true
								sectionsForPractice.append(section)
							} else {
								section.isUsedForPractice = false
								let indexOfSectionToRemove = sectionsForPractice.firstIndex { targetSection in
									targetSection.id == section.id
								}
								sectionsForPractice.remove(at: indexOfSectionToRemove!)
							}
							
							
						}
						
					}
				}
				.toolbar {
					ToolbarItem {
							Button {
								dismiss()
							} label: {
								Image(systemName: "xmark")
									.padding(8)
									.clipShape(Circle())
							}
					}
				}
			}
	
    }
}

struct PractiseView_Previews: PreviewProvider {
    static var previews: some View {
        PractiseView(appModel: AppModel())
    }
}
