//
//  ArticleListViewController+Extension.swift
//  DubaiAssignment
//
//  Created by xeadmin on 13/08/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import UIKit

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModel?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return articleViewModel.articleCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ArticleListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let storyboard = UIStoryboard( name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
        vc.articleDetailViewModel = ArticleDetailViewModel(article: articleViewModel.articles?[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

