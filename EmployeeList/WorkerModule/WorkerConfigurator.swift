//
//  WorkerConfigurator.swift
//  EmployeeList
//
//  Created by Max Nechaev on 08.09.2021.
//

import UIKit

class WorkerConfigurator {
    
    //MARK: - Create full module

    static func configure() -> UIViewController {
        
        let router = WorkerRouter()
        let dataFetcherService = DataFetcherService()
        let interactor = WorkerInteractor(dataFetcher: dataFetcherService)
        
        
        let presenter = WorkerPresenter(interactor: interactor, router: router)
        
        
        let view = WorkerViewController(output: presenter)
        presenter.viewController = view
        interactor.output = presenter
        return view
    }
}
