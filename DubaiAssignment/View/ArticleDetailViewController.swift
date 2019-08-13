//
//  ArticleDetailViewController.swift
//  DubaiAssignment
//
//  Created by xeadmin on 13/08/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    var articleDetailViewModel :ArticleDetailViewModel!
    
    @IBOutlet weak var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        articleDetailViewModel.updateArticleDetail(label: detailLabel)
        // Do any additional setup after loading the view.
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
