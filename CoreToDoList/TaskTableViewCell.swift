//
//  TaskTableViewCell.swift
//  CoreToDoList
//
//  Created by 及川ひな on 2019/10/31.
//  Copyright © 2019 oikawa. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let reuseIdentifier = "TaskCell"

    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
