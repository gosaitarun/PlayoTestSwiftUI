//
//  PTDataFetcherMocl.swift
//  PlayoTestTests
//
//  Created by Tarun on 19/09/21.
//

@testable import PlayoTest

class PTDataFetcherMock: PTDataFetcherType {

    var webserviceCallCalled = false

    func webserviceCall(url: String, completion: @escaping ServiceResponse) {
        webserviceCallCalled = true
        completion(nil,nil)
    }
}
