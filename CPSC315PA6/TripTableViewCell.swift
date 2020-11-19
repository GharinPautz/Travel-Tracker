//
//  TripTableViewCell.swift
//  CPSC315PA7
//  This program stores information about the user's trips in a table view and
//  utilizes CoreData database to have data persist across multiple runtimes.
//  CPSC 315-02, Fall 2020
//  Programming Assignment #6
//  No sources to cite
//
//  Created by Gharin Pautz on 11/4/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

/**
 The class that is in charge of the cells within the Trip table.
 
 - Parameters:
    - destinationLabel: the label where the destination is stored
    - startDateLabel: the label where the start date is stored
    - endDateLabel: the label where the end date is stored
    - tripImageView: the image that is to be displayed
 - Returns: None
 */
class TripTableViewCell: UITableViewCell {

    @IBOutlet var destionationLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    @IBOutlet var tripImageView: UIImageView!
    
    let dateFormatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /**
     Update method to change load the text fields
     
     - Parameters: trip is the Trip object
     - Returns: None
     */
    func update(with trip: Trip) {
        initializeDateFormatter()
        destionationLabel.text = trip.destinationName

        // Figure out how to make these strings
        // might have to put date formatter in this class
        startDateLabel.text = dateFormatter.string(from: trip.startDate!)
        endDateLabel.text = dateFormatter.string(from: trip.endDate!)
        
        if let imageName = trip.imageFileName {
            
            let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            // userDomainMask refers to the user's home directory
            let fileURL = documentsDirectoryURL.appendingPathComponent(imageName).appendingPathExtension("jpeg")
            
            let imageFromDisk = UIImage(contentsOfFile: fileURL.path)
            
            if imageFromDisk != nil {
                tripImageView.image = imageFromDisk
            }
        }
    }
    
    /**
    Initializes date formatter settings
    
    - Parameters: None
    - Returns: None
    */
    func initializeDateFormatter() {
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
    
}
