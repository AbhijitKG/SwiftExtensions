//
//  UITableView+identifier.swift
//  
//
//  Created by Abhijit KG on 16/01/18.
//

import Foundation

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
