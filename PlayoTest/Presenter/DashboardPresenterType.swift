//
//  DashboardPresenterType.swift
//  PlayoTest
//
//  Created by Tarun on 19/09/21.
//

protocol DashboardPresenterType {
    func fetchNews(_ category: String, completion: @escaping ([News]) -> Void)
}
