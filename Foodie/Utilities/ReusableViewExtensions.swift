//
//  ReusableViewExtensions.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
}
