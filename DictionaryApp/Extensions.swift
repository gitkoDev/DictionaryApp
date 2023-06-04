//
//  Extensions.swift
//  DictionaryApp
//
//  Created by Gitko Denis on 31.05.2023.
//

import Foundation
import SwiftUI

struct ModifyTextField: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding()
			.clipShape(RoundedRectangle(cornerRadius: 10))
				.overlay {
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color.gray)
				}
				.padding()
	}
}

extension View {
	func textFieldModifier() -> some View {
		modifier(ModifyTextField())
	}
}
