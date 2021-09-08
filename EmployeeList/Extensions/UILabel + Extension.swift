//
//  UILabel + Extension.swift
//  EmployeeList
//
//  Created by Max Nechaev on 08.09.2021.
//

import UIKit

extension UILabel {
    convenience init(text: String,
                     font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
