//
//  PTDataFetcher.swift
//  PlayoTest
//
//  Created by Tarun on 18/09/21.
//

import Alamofire

typealias ServiceResponse = ([String:Any]?, Error?) -> Void

protocol PTDataFetcherType {
    func webserviceCall(url: String, completion: @escaping ServiceResponse)
}

class PTDataFetcher: PTDataFetcherType {

    func webserviceCall(url: String, completion: @escaping ServiceResponse) {
        let request = AF.request(url)
        request.responseJSON { response in
            switch response.result {
            case .success:
                let value = response.value as? [String: Any]
                completion(value,nil)
            case let .failure(error):
                print(error)
                completion(nil,error)
            }
        }
    }
}
