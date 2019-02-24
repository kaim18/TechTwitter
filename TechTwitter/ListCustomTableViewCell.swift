//
//  ListCustomTableViewCell.swift
//  TechTwitter
//
//  Created by kai-munekuni on 2019/02/25.
//  Copyright © 2019年 kai-munekuni. All rights reserved.
//

import UIKit

class ListCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
