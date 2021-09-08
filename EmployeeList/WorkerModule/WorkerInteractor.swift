//
//  WorkerInteractor.swift
//  EmployeeList
//
//  Created by Max Nechaev on 08.09.2021.
//

import UIKit

protocol WorkerInteractorProtocol {
    func fetchWorkers()
    func takePicture(urlString: String, imageView: UIImageView)
}

protocol WorkerInteractorOutputs: AnyObject {
    func getWorkersData(workers: Workers)
}

class WorkerInteractor: WorkerInteractorProtocol {
    
    //MARK: - Dependencies

    private let dataFetcher: DataFetcherServiceProtocol
    weak var output: WorkerInteractorOutputs?
    
    //MARK: - Init

    init(dataFetcher: DataFetcherServiceProtocol) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchWorkers() {
        dataFetcher.fetchWorkers { workers in
            guard let listOfWorkes = workers else { return print("There is no list of workers") }
            self.output?.getWorkersData(workers: listOfWorkes)
        }
    }
    
    func takePicture(urlString: String, imageView: UIImageView) {
        dataFetcher.fetchImageData(urlString: urlString) { data in
            
            guard let url = URL(string: urlString) else { return print("Worker don't have image!")}
            
            if let data = try? Data(contentsOf: url) {
                imageView.image = UIImage(data: data)
            }
        }
    }
}
