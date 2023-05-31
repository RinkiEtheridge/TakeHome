//
//  NibLoadable.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import UIKit

//protocol NibLoadable: AnyObject {
//    static var nibName: String { get }
//    static var nibBundle: Bundle? { get }
//}
//
//extension NibLoadable {
//    static var nib: UINib {
//        return UINib(nibName: nibName, bundle: nibBundle)
//    }
//
//    static var nibName: String {
//        return String(describing: self)
//    }
//
//    static var nibBundle: Bundle? {
//        return Bundle(for: self)
//    }
//}
//
//extension NibLoadable where Self: UIView {
//    static func loadFromNib() -> Self {
//        return nib.instantiate(withOwner: nil, options: nil).first as! Self
//    }
//}
