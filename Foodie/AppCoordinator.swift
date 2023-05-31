//
//  AppCoordinator.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import UIKit

class AppCoordinator {

    let navigationController: UINavigationController
    var foodView: FoodieViewController?

    init() {
        // Initiate the navigation controller with the main foodie Page
        foodView = FoodieViewController()
        navigationController = UINavigationController(rootViewController: foodView!)
    }
}
