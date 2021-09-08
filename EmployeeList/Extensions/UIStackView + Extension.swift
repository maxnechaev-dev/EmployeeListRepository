//
//  UIStackView + Extension.swift
//  EmployeeList
//
//  Created by Max Nechaev on 08.09.2021.
//

import UIKit

extension UIStackView {
    convenience init (arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}
