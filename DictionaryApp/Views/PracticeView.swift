//
//  PracticeView.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 04.06.2023.
//

import SwiftUI

struct PracticeView: View {
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
			NavigationStack {
				VStack {
					
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

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
