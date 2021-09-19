//
//  CategoryView.swift
//  PlayoTest
//
//  Created by Tarun on 19/09/21.
//

import SwiftUI

struct CategoryView: View {
    
    @Binding var selectedCategory: String
    let categories = ["Sports", "Bollywood", "Politics", "Art"]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(categories,id: \.self) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        Text(category)
                            .font(.title)
                            .padding(8)
                            .background(selectedCategory == category ? Color.gray :  Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }.padding([.leading,.trailing], 15)
        }
        .padding([.top, .bottom], 5)
    }
}

