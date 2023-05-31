//
//  BaseViewController.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = " "
        self.setupSubviews()
        self.addAndLayoutSubviews()
    }

    func setupSubviews() {
        // Subclasses to override
    }

    func addAndLayoutSubviews() {
        // Subclasses to override
    }

    // MARK: - Alert

    func showAlert(title: String?, message: String? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: FoodieText.OK, style: .cancel, handler: nil)
        alertVC.addAction(dismiss)
        present(alertVC, animated: true, completion: nil)
    }
}
