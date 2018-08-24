//
//  TableViewCell.swift
//  VideoPlayer
//
//  Created by Soemsak on 24/8/2561 BE.
//  Copyright © 2561 Trabal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        videoImageView.isHidden = true
    }

}
