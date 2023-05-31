//
//  FoodItemCell.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/31/23.
//

import UIKit

class FoodItemCell: UITableViewCell, Reusable {
    private(set) weak var titleLabel: UILabel!
    private(set) weak var chevron: UIImageView!

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        sharedInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }

    private func sharedInit() {
        selectionStyle = .none

        let title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping

        let chevron = UIImageView.init(image: UIImage(systemName: "chevron.forward"))
        self.titleLabel = title
        self.chevron = chevron

        addSubview(title)
        addSubview(chevron)

        chevron.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(UIConstants.Gutter)
        }

        title.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(UIConstants.Gutter)
        }
    }

    func configure(for foodItem: FoodItem) {
        titleLabel.text = foodItem.name
    }
}
