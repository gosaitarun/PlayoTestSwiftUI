//
//  NewsListView.swift
//  PlayoTest
//
//  Created by Tarun on 18/09/21.
//

import SwiftUI

struct NewsListView: View {
    
    @Binding var arrayNews: [News]
    
    var body: some View {
        List(arrayNews) { news in
            Button(action: {
                guard let url = URL(string: news.link) else {
                    return
                }
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }) {
                Text(news.name.capitalized)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
            }
        }
    }
}
