//
//  SingleListSection.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 01.06.2023.
//

import SwiftUI

struct SingleSectionView: View {
	@ObservedObject var appModel: AppModel
	@State private var isAddEntryViewShown: Bool = false
	@State private var isPratiseViewShown: Bool = false
	var section: SingleSectionModel
	@State private var isAlertShown: Bool = false
	
	func getSectionIndex() -> Int? {
		if let sectionIndex = appModel.allSections.firstIndex(where: { section in
			section.id == self.section.id
		}) {
			return sectionIndex
		}
		
		return nil
	}
	
    var body: some View {
				Section {
					HStack {
						Spacer()
						Menu {
							Button {
								isAddEntryViewShown.toggle()
							} label: {
								Text("Add word")
								Image(systemName: "plus")
							}
							
							Button {
								isPratiseViewShown.toggle()
							} label: {
								Text("Practise words")
								Image(systemName: "book")
							}

							Button {
								isAlertShown.toggle()
							} label: {
								Text("Delete folder")
								Image(systemName: "trash")
							}

						} label: {
							Image(systemName: "line.3.horizontal")
								.font(.title2)
						}
					}
					
					ForEach(section.allSectionEntries) { entry in
							SingleEntryView(entry: entry)
					}
					.onDelete { indexSet in
						
// If allSections array isn't empty (e.g. if we have sections/folders), then delete an entry
						
						if let sectionIndex = getSectionIndex() {
							appModel.allSections[sectionIndex].deleteEntry(at: indexSet)
						}

					}
				} header: {
					HStack {
						Text(section.sectionName)
						Spacer()
					}
					
				}
				.sheet(isPresented: $isAddEntryViewShown) {
					AddEntryView(appModel: appModel, chosenSection: section.sectionName)
				}
				.fullScreenCover(isPresented: $isPratiseViewShown, content: {
					WordsForPracticeView(appModel: appModel)
				})
				.confirmationDialog("", isPresented: $isAlertShown) {
					Button("Delete Folder", role: .destructive) {
						if let sectionIndex = getSectionIndex() {
							withAnimation {
								appModel.deleteSection(at: sectionIndex)
							}
						}
					}
				}
				}
    }


struct SingleListSection_Previews: PreviewProvider {
    static var previews: some View {
			SingleSectionView(appModel: AppModel(), section: SingleSectionModel(sectionName: "Test", isUsedForPractice: false))
    }
}
