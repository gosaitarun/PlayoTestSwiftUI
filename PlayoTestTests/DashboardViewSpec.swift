//
//  DashboardViewSpec.swift
//  PlayoTestTests
//
//  Created by Tarun on 19/09/21.
//

import XCTest
import ViewInspector

@testable import PlayoTest

extension DashboardView: Inspectable {}
extension SearchBarView: Inspectable {}
extension CategoryView: Inspectable {}
extension NewsListView: Inspectable {}

class DashboardViewSpec: XCTestCase {

    func testSearchView() throws {
        let dashboard = DashboardView()
        let searchview = try dashboard.inspect().vStack().view(SearchBarView.self, 0)
        XCTAssertNotNil(searchview)
    }

    func testCategoryView() throws {
        let dashboard = DashboardView()
        let categoryView = try dashboard.inspect().vStack().view(CategoryView.self, 2)
        XCTAssertNotNil(categoryView)
    }

    func testNewsListView() throws {
        let dashboard = DashboardView()
        let newsList = try dashboard.inspect().vStack().view(NewsListView.self, 5)
        XCTAssertNotNil(newsList)
    }

    func testFetchData() throws {
        let presenter = DashboardPresenterMock()
        var dashboard = DashboardView()
        dashboard.presenter = presenter
        XCTAssertFalse(presenter.fetchNewsCalled)
        try dashboard.inspect().vStack().callOnAppear()
        XCTAssertTrue(presenter.fetchNewsCalled)
    }

}
