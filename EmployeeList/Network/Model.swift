//
//  Model.swift
//  EmployeeList
//
//  Created by Max Nechaev on 08.09.2021.
//

import Foundation

// MARK: - Model

struct WorkerElement: Codable {
    let name, city, age, position: String
    let exp: String
    let image: String
}

typealias Workers = [WorkerElement]
