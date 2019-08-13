//
//  ViewController.swift
//  DubaiAssignment
//
//  Created by xeadmin on 31/07/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    var articleViewModel :ArticleViewModel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        articleViewModel = ArticleViewModel()
        self.getMostViewedArticle()
    }

    @IBAction func changePeriod(_ sender: Any) {
        let options = UIAlertController(title: "Choose Number of Days", message: "Shows the content from past so many number of Days.", preferredStyle: .actionSheet)
        
        options.addAction(UIAlertAction(title: "1", style: .default, handler: { (alert: UIAlertAction) -> Void in
            Constants.period = alert.title ?? "7"
            self.getMostViewedArticle()
        }))
        options.addAction(UIAlertAction(title: "7", style: .default, handler: { (alert: UIAlertAction) -> Void in
            Constants.period = alert.title ?? "7"
            self.getMostViewedArticle()
        }))
        options.addAction(UIAlertAction(title: "30", style: .default, handler: { (alert: UIAlertAction) -> Void in
            Constants.period = alert.title ?? "7"
            self.getMostViewedArticle()
        }))
        
        options.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(options, animated: true, completion: nil)
    }
    
    func getMostViewedArticle(){
        NetworkManager.sharedNetworkManager.getMostPopularArticles { [weak self] (articles, error) in
            guard let self = self else { return }
            if let articles = articles {
                self.articleViewModel.articles = articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}



