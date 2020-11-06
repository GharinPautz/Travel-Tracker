//
//  TripTableViewCell.swift
//  CPSC315PA6
//
//  Created by Gharin Pautz on 11/4/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet var destionationLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with trip: Trip) {
        initializeDateFormatter()
        destionationLabel.text = trip.destinationName

        // Figure out how to make these strings
        // might have to put date formatter in this class
        startDateLabel.text = dateFormatter.string(from: trip.startDate)
        endDateLabel.text = dateFormatter.string(from: trip.endDate)
    }
    
    func initializeDateFormatter() {
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
    
}
