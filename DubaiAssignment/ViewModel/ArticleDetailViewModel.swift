//
//  ArticleDetailViewModel.swift
//  DubaiAssignment
//
//  Created by xeadmin on 13/08/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import Foundation
import UIKit
struct ArticleDetailViewModel {
    
    var article: Article?
    
    func updateArticleDetail(label:UILabel){
        label.text = article?.abstract
    }
    
}
