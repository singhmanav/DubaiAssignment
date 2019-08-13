//
//  Article.swift
//  DubaiAssignment
//
//  Created by xeadmin on 12/08/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import Foundation

struct Article: Codable {
    
    var id: Int
    var assetId: Int
    var author: String?
    var title: String?
    var publisherDate: String?
    var source: String?
    var abstract: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case assetId = "asset_id"
        case author = "byline"
        case title = "title"
        case publisherDate = "published_date"
        case source = "source"
        case abstract = "abstract"
    }

}


