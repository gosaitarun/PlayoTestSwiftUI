//
//  DashboardPresenterSpec.swift
//  PlayoTestTests
//
//  Created by Tarun on 19/09/21.
//

import XCTest

@testable import PlayoTest

class DashboardPresenterSpec: XCTestCase {

    func testFetchNews() {
        let fetcher = PTDataFetcherMock()
        let presenter = DashboardPresenter()
        presenter.dataFetcher = fetcher
        XCTAssertFalse(fetcher.webserviceCallCalled)
        presenter.fetchNews("test") { _ in }
        XCTAssertTrue(fetcher.webserviceCallCalled)
    }
}
