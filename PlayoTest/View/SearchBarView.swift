//
//  SearchBarView.swift
//  PlayoTest
//
//  Created by Tarun on 18/09/21.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var text: String = ""
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .frame(height: 45, alignment: .center)
                .padding(.horizontal, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 15)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    hideKeyboard()
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 15)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }.padding(.bottom, 10)
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
