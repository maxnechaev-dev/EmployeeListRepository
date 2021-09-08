//
//  DataFetcherService.swift
//  EmployeeList
//
//  Created by Max Nechaev on 08.09.2021.
//

import Foundation

//MARK: - Data fetcher service

protocol DataFetcherServiceProtocol {
    func fetchWorkers (completion: @escaping (Workers?) -> Void)
    func fetchImageData(urlString: String, completion: @escaping (Data?) -> Void)
}

class DataFetcherService: DataFetcherServiceProtocol {
    
    var networkDataFetcher: DataFetcher
    let urlWorkers = "https://mocki.io/v1/11147ca7-4d90-4624-94a7-4767662524ad"
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    func fetchWorkers (completion: @escaping (Workers?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(urlString: urlWorkers, response: completion)
    }
    
    func fetchImageData(urlString: String, completion: @escaping (Data?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
}
