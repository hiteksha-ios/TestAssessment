//
//  UIView+Reuseidentifier+Extension.swift
//  TestAssignment
//
//  Created by Hitexa Kakadiya on 27/05/24.
//

import UIKit

protocol ReuseIdentifier {
  
  static var reuseIdentifier: String { get }
  
}

extension ReuseIdentifier {
  
  /// Return a suggested name that can be used as an cellIdentifier.
  static var reuseIdentifier: String {
    return String(describing: self)
  }
  
}
extension UITableViewCell: ReuseIdentifier {}
extension UITableViewHeaderFooterView: ReuseIdentifier {}


extension UIView {
    //MARK:- UINib Functions
    ///Return an UINib object from the nib file with the same name.
    class var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

