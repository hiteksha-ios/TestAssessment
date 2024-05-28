//
//  DetailPostViewController.swift
//  TestAssignment
//
//  Created by Hitexa Kakadiya on 27/05/24.
//

import UIKit

class DetailPostViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var detailPostObject: PostResponse? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailData()
        // Do any additional setup after loading the view.
    }
    func setUpDetailData() {
        idLabel.text = "\(detailPostObject?.id ?? 0)"
        userIdLabel.text = "\(detailPostObject?.userId ?? 0)"
        titleLabel.text = detailPostObject?.title ?? ""
        bodyLabel.text = detailPostObject?.body ?? ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
