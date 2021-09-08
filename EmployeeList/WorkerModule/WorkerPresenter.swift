//
//  WorkerPresenter.swift
//  EmployeeList
//
//  Created by Max Nechaev on 08.09.2021.
//

import UIKit

class WorkerPresenter {
    
    var cellId: String = "cellID"
    
    //MARK: - Dependencies

    weak var viewController: WorkerViewController?
    private let interactor: WorkerInteractorProtocol
    private let router: WorkerRouterProtocol
    
    //MARK: - Init

    init(interactor: WorkerInteractorProtocol,
         router: WorkerRouterProtocol) {
        self.router = router
        self.interactor = interactor
    }
}


//MARK: - Realisation WorkerViewOutput

extension WorkerPresenter: WorkerViewOutput {
        
    func viewIsReady() {
        interactor.fetchWorkers()
    }
    
    func cellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = viewController?.collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WorkerCustomCell
        cell.backgroundColor = .secondarySystemBackground
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        let element = viewController!.listOfWorkers[indexPath.row]
        cell.nameLabel.text = "\(element.name), \(element.age) years"
        cell.cityLabel.text = element.city
        cell.positionLabel.text = "\(element.position) for \(element.exp)"
        
        
        interactor.takePicture(urlString: element.image, imageView: cell.imageView)
        return cell
    }
    
    func sizeForItemAt(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 1
        let paddingWidth = 20 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem / 3)
    }
}

//MARK: - Realisation WorkerInteractorOutputs

extension WorkerPresenter: WorkerInteractorOutputs {
    
    func getWorkersData(workers: [WorkerElement]) {
        viewController?.listOfWorkers = workers
        viewController?.collectionView.reloadData()
    }
}
