//
//  WorkerCustomCell.swift
//  EmployeeList
//
//  Created by Max Nechaev on 08.09.2021.
//

import UIKit

class WorkerCustomCell: UICollectionViewCell {
    
    //MARK: - Create UI elements

    let imageView = UIImageView(image: UIImage(named: "anon"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Name name, XX age", font: .systemFont(ofSize: 16, weight: .bold))
    let cityLabel = UILabel(text: "City", font: .systemFont(ofSize: 16, weight: .light))
    let positionLabel = UILabel(text: "Position for (time)", font: .systemFont(ofSize: 16, weight: .light))

    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 14
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup constraints

extension WorkerCustomCell {
    
    private func setupConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 14
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, cityLabel, positionLabel], axis: .vertical, spacing: 10)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: heightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        ])
    }
}



//MARK: - Swift UI canvas

import SwiftUI

struct WorkerCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = WorkerConfigurator.configure()

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}
