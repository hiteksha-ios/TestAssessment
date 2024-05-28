//
//  PostVCExtension.swift
//  TestAssignment
//
//  Created by Hitexa Kakadiya on 27/05/24.
//

import Foundation
import UIKit


extension PostViewController : UITableViewDataSource
{
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postTableData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseIdentifier, for: indexPath) as! PostCell
        let model = postTableData?[indexPath.row]
        cell.idLabel.text = "\(model?.id ?? 0)"
        cell.titleLabel.text = model?.title ?? ""
        return cell
    }
}
extension PostViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(identifier: "DetailPostViewController") as? DetailPostViewController else { return }
        detailVC.detailPostObject = postTableData?[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell is PostCell {
            // your code here
            let lastSectionIndex = tableView.numberOfSections - 1
            let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 2
            if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
                let spinner = UIActivityIndicatorView(style: .medium)
                spinner.startAnimating()
                spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
                postTableView.tableFooterView = spinner
                postTableView.tableFooterView?.isHidden = false
                apiCall()
            }
        }
    }
}
extension PostViewController : PostViewModelDelegate
{
    func didReceivePostResponse(response: [PostResponse]?) {
        if response?.count ?? 0 != 0 {
            postTableData?.append(contentsOf: response ?? [])
            postTableView.tableFooterView?.isHidden = true
            postTableView.reloadData()
        }
    }
}
