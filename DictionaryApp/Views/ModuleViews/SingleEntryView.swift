//
//  SingleEntryView.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 01.06.2023.
//

import SwiftUI

struct SingleEntryView: View {
	var entry: SingleEntryModel
	
    var body: some View {
			HStack {
				VStack {
					Text(entry.word)
						.font(.headline)
						.padding(.bottom, 0.5)
					Text(entry.translation)
				}
				Spacer()
				ZStack {
					Image(systemName: "circle")
						.font(.system(size: 50))
						.foregroundColor(.red)
					Text("\(entry.masteryPercentage.rawValue)%")
						.font(.system(size: 13))
				}
			}
    }
}

struct SingleEntryView_Previews: PreviewProvider {
    static var previews: some View {
			SingleEntryView(entry: SingleEntryModel(word: "Test", translation: "Тест", masteryPercentage: .notPractised))
    }
}
