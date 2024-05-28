//
//  ViewController.swift
//  TestAssignment
//
//  Created by Hitexa Kakadiya on 27/05/24.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    
    private var postViewModel = PostViewModel()
    var pageNumber: Int = 0
    var limitCount: Int = 15
    var postTableData : [PostResponse]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        postViewModel.delegate = self
        registerTabkeViewCell()
        apiCall()
        // Do any additional setup after loading the view.
    }
    func registerTabkeViewCell() {
        postTableView.dataSource = self
        postTableView.delegate = self
        postTableView.register(PostCell.nib, forCellReuseIdentifier: PostCell.reuseIdentifier)
    }
    
    func apiCall() {
        pageNumber += 1
        postViewModel.getPostApi(pageNumber: pageNumber, limit: limitCount)
    }
}

