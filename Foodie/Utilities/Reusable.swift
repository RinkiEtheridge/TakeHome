//
//  Reusable.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(reflecting: self)
    }
}
