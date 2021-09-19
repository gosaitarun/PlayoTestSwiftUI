//
//  ContentView.swift
//  PlayoTest
//
//  Created by Tarun on 18/09/21.
//

import SwiftUI

struct DashboardView: View {

    var presenter = DashboardPresenter()

    @State private var arrayNews = [News]()
    @State private var isDataLoading = false
    @State private var selectedCategory: String = "Sports"

    var body: some View {
        VStack {
            SearchBarView()
            Divider()
            CategoryView(selectedCategory: $selectedCategory)
                .onChange(of: selectedCategory, perform: { value in
                    fetchNews(selectedCategory)
                })
            Divider()
            if isDataLoading {
                withAnimation {
                    ProgressView()
                        .frame(width: 30, height: 30, alignment: .center)
                }
            }
            NewsListView(arrayNews: $arrayNews)
        }.onAppear {
            fetchNews(selectedCategory)
        }
    }

    private func fetchNews(_ category: String) {
        isDataLoading = true
        presenter.fetchNews(category) { news in
            isDataLoading = false
            arrayNews = news
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
