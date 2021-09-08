//
//  ViewController.swift
//  EmployeeList
//
//  Created by Max Nechaev on 08.09.2021.
//

import UIKit

protocol WorkerViewOutput {
    var cellId: String { get set }
    func viewIsReady()
    func cellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func sizeForItemAt(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
}

class WorkerViewController: UIViewController {
    
    //MARK: - Dependencies

    var output: WorkerViewOutput

    //MARK: - Init

    init(output: WorkerViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: - Create Collection view

    var listOfWorkers: [WorkerElement] = []
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(WorkerCustomCell.self, forCellWithReuseIdentifier: output.cellId)
        collectionview.backgroundColor = .systemBackground
        
        return collectionview
    }()
    
    //MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupConstraints()
        self.title = "Employee List"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extension delegate, data source

extension WorkerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfWorkers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        output.cellForItemAt(collectionView, cellForItemAt: indexPath)
    }
    
    
}

//MARK: - Extension delegate flow layout

extension WorkerViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        output.sizeForItemAt(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20)
    }
}

//MARK: - Setup constraints

extension WorkerViewController {
    
    func setupConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
