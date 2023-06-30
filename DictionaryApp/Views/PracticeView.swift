//
//  PracticeView.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 04.06.2023.
//

import SwiftUI

struct PracticeView: View {
	@Environment(\.dismiss) var dismiss
	@EnvironmentObject var appModel: AppModel
	@State var questionCount: Int = 1
	@State var questionWord = "test"
	@State private var allForeignWords = [String]()
	@State var allTranslations = [String:String]()
	
    var body: some View {
			NavigationStack {
				Text(appModel.allSections[0].sectionName)
				VStack {
					Text("Question \(questionCount)")
						.font(.title).bold()
						.underline()
						.padding(.bottom)
					Text("What is the translation of the word \(questionWord)?")
						.padding()
					ForEach(1..<5) { index in
						Button {
						} label: {
							Text("\(index)")
							.frame(maxWidth: .infinity)
							.frame(height: 40)
							.font(.headline)
							.foregroundColor(.white)
							.padding()
							.padding(.horizontal)
							.background(.blue)
							.clipShape(RoundedRectangle(cornerRadius: 10))
						}
						.clipShape(
							RoundedRectangle(cornerRadius: 10)
						)
						.padding(.horizontal)
						.padding(.vertical, 2)


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
			.environmentObject(appModel)
			.onAppear {
				askQuestion()
				getWords()
			}
			
			
    }
	
	func getWords() {

		for section in appModel.sectionsForPractice {
			for word in section.allSectionEntries {
				//		Get an array of all the  words in english
				if allForeignWords.contains(word.word) {
					return
				} else {
					allForeignWords.append(word.word)
				}

				// Get a dictionary word:translation for comparison when the user answers
				allTranslations[word.word] = word.translation
				print(allForeignWords.count, allTranslations.count)
			}
		}

		
	}
	
	func askQuestion() {
//		questionWord = appModel.sectionsForPractice.randomElement()?.allSectionEntries.randomElement()?.word ?? ""
	
	}
	
	
	
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
			PracticeView()
				.environmentObject(AppModel())
    }
}
