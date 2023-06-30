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
	@State private var questionCount: Int = 1
	@State private var questionWord = "test"
	private var allWords = [String]()
	private var allTranslations = [String]()
	
    var body: some View {
			NavigationStack {
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
								.frame(height: 80)

								.background(.mint)
						}
						.clipShape(
							RoundedRectangle(cornerRadius: 10)
						)
						.padding(.horizontal)


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
			}
			
			
    }
	
	func askQuestion() {
		questionWord = appModel.sectionsForPractice.randomElement()?.allSectionEntries.randomElement()?.word ?? ""
	}
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
				.environmentObject(AppModel())
    }
}
