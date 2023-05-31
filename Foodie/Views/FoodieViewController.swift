//
//  FoodieViewController.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import UIKit

class FoodieViewController: BaseViewController {

    // MARK: - UI

    private let searchBar = UISearchBar()
    private var resultsTable = UITableView()
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    private let label = UILabel()

    // MARK: - Represented Object

    let searchService = FoodFinderService()

    var foodItems: FoodItems = [] {
        didSet {
            updateView()
        }
    }

    // MARK: - Helper methods

    override func setupSubviews() {
        view.backgroundColor = .white
        searchBar.placeholder = FoodieText.Search
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.secondarySystemBackground

        navigationItem.titleView = searchBar

        resultsTable.register(cellType: FoodItemCell.self)

        resultsTable.delegate = self
        resultsTable.dataSource = self
        resultsTable.separatorStyle = .singleLine

        label.text = Messages.EnterFood
        label.textColor = .black
    }

    override func addAndLayoutSubviews() {
        view.addSubview(resultsTable)
        view.addSubview(activityIndicator)
        view.addSubview(label)

        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        resultsTable.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(UIConstants.Gutter)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(UIConstants.Gutter)
            make.left.right.equalToSuperview()
        }
    }

    private func activityInProgress(isLoading: Bool) {
        if isLoading {
            foodItems.removeAll()
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            label.isHidden = true
        } else {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }

    // Display table view if there us any food item present or display label with informative text.
    private func updateView() {
        guard !activityIndicator.isAnimating else {
            return
        }
        resultsTable.reloadData()
        resultsTable.isHidden = foodItems.isEmpty
        label.isHidden = !foodItems.isEmpty
    }

    // MARK: - Network Call

    private func searchFoodItems(text: String) {
        Task(priority: .background) {
            activityInProgress(isLoading: true)
            let result = await searchService.getFoodList(text: text.lowercased())
            activityInProgress(isLoading: false)
            switch result {
            case .success(let foodItems):
                self.foodItems = foodItems
            case .failure(let error):
                label.text = error.errorMessage
                self.foodItems = []
            }
        }
    }

}

// MARK: - Search bar delegate

extension FoodieViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        foodItems.removeAll()
        guard !searchText.isEmpty else {
            resultsTable.reloadData()
            return
        }
        // Make a network request to fetch search results
        if searchText.count >= 3 {
            searchFoodItems(text: searchText)
        }
    }

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
}

// MARK: - Table View delegate

extension FoodieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodItem = foodItems[indexPath.row]
        showAlert(title: foodItem.name)
    }
}

// MARK: - Table View data source

extension FoodieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FoodItemCell.self)
        cell.configure(for: foodItems[indexPath.row])
        return cell
    }
}
