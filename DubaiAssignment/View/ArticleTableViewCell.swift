//
//  ArticleTableViewCell.swift
//  DubaiAssignment
//
//  Created by xeadmin on 12/08/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagLine: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func applyModel(model: Article?) {
        titleLabel.text = model?.title
        tagLine.text = model?.author
        date.text = model?.publisherDate
    }

}
