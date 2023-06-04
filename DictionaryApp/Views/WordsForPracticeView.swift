//
//  PractiseView.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 31.05.2023.
//


import SwiftUI

struct WordsForPracticeView: View {
	@Environment(\.dismiss) var dismiss
	@ObservedObject var appModel: AppModel
	@State private var sectionsForPractice: [SingleSectionModel] = [SingleSectionModel]()
	@State private var areAllSectionsChosen: Bool = false
	
	
	func test() {
		
	}
	
    var body: some View {
			NavigationStack {
				List {
					Section {
//						Checkbox to choose all the sections
						HStack {
							Image(systemName: areAllSectionsChosen ? "checkmark.square" : "square")
							Text("All words")
								.font(.headline)
						}
						.onTapGesture {
							areAllSectionsChosen.toggle()
						}
						.padding()
//						Checkboxes for user created sections
						
						ForEach($appModel.allSections) { $section in
						 HStack {
// Check all boxes if the user chose to practise all the words
							 Image(systemName: areAllSectionsChosen ? "checkmark.square" : section.isUsedForPractice ? "checkmark.square" : "square")
							 Text(section.sectionName)
						 }
						 .onTapGesture {
							 if areAllSectionsChosen == true {
								 section.isUsedForPractice = true
								 sectionsForPractice.append(section)
							 } else {
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
					} footer: {
						HStack {
							Spacer()
							Button {
								
							} label: {
									Text("Practise")
									.font(.headline)
									.foregroundColor(.white)
									.padding()
									.padding(.horizontal)
									.background(.blue)
									.clipShape(RoundedRectangle(cornerRadius: 10))
							}
							.padding(.vertical, 50)
							Spacer()
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
        WordsForPracticeView(appModel: AppModel())
    }
}
