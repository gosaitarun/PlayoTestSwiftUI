//
//  DashboardPresenter.swift
//  PlayoTest
//
//  Created by Tarun on 19/09/21.
//

import Foundation

class DashboardPresenter: DashboardPresenterType {

    var dataFetcher: PTDataFetcherType = PTDataFetcher()

    func fetchNews(_ category: String, completion: @escaping ([News]) -> Void) {
        dataFetcher.webserviceCall(url: PTConstant.mainURL+category.lowercased()) { data, error in
            guard let response = data else {
                completion([])
                return
            }
            self.parseNews(response: response, completion: completion)
        }
    }

    private func parseNews(response: [String:Any], completion: ([News]) -> Void) {
        let hits = response["hits"] as? [[String:Any]]
        var fetchedNews = [News]()
        hits?.forEach { hit in
            let name = hit["title"] as? String
            let url = hit["url"] as? String
            guard let title = name, let link = url else {
                return
            }
            let news = News(name: title, link: link)
            fetchedNews.append(news)
        }
        completion(fetchedNews)
    }
}
