//
//  ContentView.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 31.05.2023.
//

import SwiftUI

struct MainView: View {
	@StateObject var appModel = AppModel()
	
	@State private var isAddEntryViewShown: Bool = false
	@State private var isPractiseViewShown: Bool = false
	@State private var sectionName: String = ""
	
	@State private var isAlertShown: Bool = false
	
	func addSection() {
		withAnimation {
			guard !sectionName.isEmpty else {
				return
			}

			appModel.allSections.insert(SingleSectionModel(sectionName: sectionName, isUsedForPractice: false), at: 0)
			sectionName = ""
		}
	}
	
    var body: some View {
        NavigationStack {
						List {
							HStack {
//								MARK: Button to create a new folder
								Button {
									isAlertShown.toggle()
								} label: {
									Image(systemName: "plus")
								}
								Text("New folder")
							}
							
//							Display all the sections/folders created by the user
							
							ForEach(appModel.allSections) { section in
								SingleSectionView(appModel: appModel, section: section)
							}
							
						}
						.listStyle(.sidebar)
					Button(action: {
						isPractiseViewShown.toggle()
					}, label: {
							Text("Practise")
					})

//					MARK: Toolbar
					.toolbar {
						EditButton()
							Button {
								isAddEntryViewShown.toggle()
							} label: {
									Image(systemName: "plus")
							}



					}
					.sheet(isPresented: $isAddEntryViewShown, content: {
						AddEntryView(appModel: appModel)
					})
					.fullScreenCover(isPresented: $isPractiseViewShown, content: {
						PractiseView(appModel: appModel)
					})

					.alert("New Folder", isPresented: $isAlertShown , actions: {
						TextField("", text: $sectionName)
						Button("Cancel", role: .cancel) {
							
						}
						Button("Ok") {
							addSection()
						}
					}, message: {
						Text("Enter new folder's name")
					})
					
					.navigationTitle("Dictionary")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
