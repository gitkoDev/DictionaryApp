//
//  AddEntryView.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 31.05.2023.
//

import SwiftUI

struct AddEntryView: View {
	@Environment(\.dismiss) var dismiss
	@ObservedObject var appModel: AppModel
	@State var chosenSection: String = "All words 2"

	@State private var newWord: String = ""
	@State private var newWordTranslation: String = ""
	
	
    var body: some View {
			VStack {
				Text("Add a new entry")
					.font(.title2).bold()
				
				TextField("Enter a new word", text: $newWord)
					.textFieldModifier()
				
				TextField("Enter the translation", text: $newWordTranslation)
					.textFieldModifier()
				
				HStack {
					Text("Select a folder")
					Spacer()
					Picker(selection: $chosenSection) {
						ForEach(appModel.sectionsNames, id: \.self) { option in
							Text(option)
						}
					} label: {
						
					}
					.pickerStyle(.inline)

				}
				.padding(.horizontal)
				.padding(.horizontal)
				
				
				Spacer()
			}
			.onSubmit {
				let sectionIndex = appModel.allSections.firstIndex(where: { $0.sectionName == chosenSection
				})

				appModel.allSections[sectionIndex ?? 0].allSectionEntries.append(SingleEntryModel(word: newWord, translation: newWordTranslation, masteryPercentage: .notPractised))

				dismiss()
			}
			.padding(.top)
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView(appModel: AppModel())
    }
}
