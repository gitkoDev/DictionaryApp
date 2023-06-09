//
//  PractiseView.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 31.05.2023.
//


import SwiftUI

struct WordsForPracticeView: View {
	@Environment(\.dismiss) var dismiss
	@EnvironmentObject var appModel: AppModel
	@State private var areAllSectionsChosen: Bool = false
	@State private var isPracticeViewShown: Bool = false
	var wordsForPractise = [String]()
	
	@State private var isAlertPresented = false
	
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
							if areAllSectionsChosen {
								appModel.sectionsForPractice.removeAll()
								for section in appModel.allSections {
									appModel.sectionsForPractice.append(section)
								}
							} else {
								appModel.sectionsForPractice.removeAll()
								print("removed all", appModel.sectionsForPractice)
								for index in 0..<appModel.allSections.count {
									appModel.allSections[index].isUsedForPractice = false
								}
							}
							print(appModel.sectionsForPractice.count)
						}
						.padding()
						
						ForEach($appModel.allSections) { $section in
						 HStack {
// Check all boxes if the user chose to practise all the words
							 Image(systemName: areAllSectionsChosen ? "checkmark.square" : section.isUsedForPractice ? "checkmark.square" : "square")
							 Text(section.sectionName)
						 }
						 .onTapGesture {
							 if areAllSectionsChosen == true {
								 areAllSectionsChosen = false
// We need to check the box back to true, if we don't, it will be unchecked like the rest of the items in the list, because they ALL get unchecked by default
								 for index in 0..<appModel.allSections.count {
									 appModel.allSections[index].isUsedForPractice = false
								 }
								 section.isUsedForPractice = true
								 appModel.sectionsForPractice.removeAll()
								 appModel.sectionsForPractice.append(section)
							 } else {
								 if !section.isUsedForPractice {
									 section.isUsedForPractice = true
//									 sectionsForPractice.append(section)
									 appModel.sectionsForPractice.append(section)
								 } else {
									 section.isUsedForPractice = false
									 let indexOfSectionToRemove = appModel.sectionsForPractice.firstIndex { targetSection in
										 targetSection.id == section.id
									 }
									 appModel.sectionsForPractice.remove(at: indexOfSectionToRemove!)
								 }
							 }
						 }
					 }
					} footer: {
						HStack {
							Spacer()
							Button {
								var allWordsToPractise = 0
								for section in appModel.sectionsForPractice {
									allWordsToPractise += section.allSectionEntries.count
									if allWordsToPractise >= 4 {
										isPracticeViewShown.toggle()
										return
									}
								}
//								If we have fewer than 4 words to practise, show an alert message
								isAlertPresented.toggle()

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
								appModel.sectionsForPractice.removeAll()
							} label: {
								Image(systemName: "xmark")
									.padding(8)
									.clipShape(Circle())
							}
					}
				}
				.fullScreenCover(isPresented: $isPracticeViewShown) {
					PracticeView()
				}
				.alert("Not enough words", isPresented: $isAlertPresented) {
					Button("Dismiss") {
						
					}
				} message: {
					Text("You need to choose at least 4 words for practise")
				}

			}
//			Uncheck all boxes if practise view is dismissed
			.onDisappear {
				for index in 0..<appModel.allSections.count {
					appModel.allSections[index].isUsedForPractice = false
				}
			}
	
    }
	
}

struct PractiseView_Previews: PreviewProvider {
    static var previews: some View {
			WordsForPracticeView( )
				.environmentObject(AppModel())
    }
}
