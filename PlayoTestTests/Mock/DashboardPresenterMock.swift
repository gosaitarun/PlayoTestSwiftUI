//
//  DashboardPresenterMock.swift
//  PlayoTestTests
//
//  Created by Tarun on 19/09/21.
//

@testable import PlayoTest

class DashboardPresenterMock: DashboardPresenterType {
    
    var fetchNewsCalled = false
    var newsToReturn = [News]()
    
    func fetchNews(_ category: String, completion: @escaping ([News]) -> Void) {
        fetchNewsCalled = true
        completion(newsToReturn)
    }
}
