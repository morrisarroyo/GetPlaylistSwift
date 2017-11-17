//
//  PlaylistTableViewCell.swift
//  GetPlaylist
//
//  Created by Morris Arroyo on 2017-11-17.
//  Copyright © 2017 Morris Arroyo. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {

    @IBOutlet weak var playlistCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
