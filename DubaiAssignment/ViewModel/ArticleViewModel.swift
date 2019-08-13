//
//  ArticleViewModel.swift
//  DubaiAssignment
//
//  Created by xeadmin on 12/08/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import Foundation
import UIKit
struct ArticleViewModel {
    
    var articles: [Article]?
    
    func articleCell(tableView: UITableView, indexPath: IndexPath) -> ArticleTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleListTableCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Unable to load ArticleTableViewCell")
        }
        
        cell.applyModel(model: self.articles?[indexPath.row])
        return cell
    }
}
