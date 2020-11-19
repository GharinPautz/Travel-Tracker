//
//  TripDetailViewController.swift
//  CPSC315PA6
//  This program stores information about the user's trips in a table view.
//  CPSC 315-02, Fall 2020
//  Programming Assignment #6
//  No sources to cite
//
//  Created by Gharin Pautz on 11/4/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

/**
 The view controller for the screen that displays details of trips
 
 - Parameters:
    - tripOptional: the trip object that is being worked with
    - tripNumber: the currently selected trip within the table
    - tripCount: the total count of trips
 - Returns: None
 */
class TripDetailViewController: UIViewController {

    var tripOptional: Trip? = nil
    var tripNumber: Int? = nil
    var tripCount: Int? = nil
    
    var dateFormatter = DateFormatter()
    
    
    @IBOutlet var tripCountLabel: UILabel!
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    @IBOutlet var tripImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeDateFormatter()
        displayTrip()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func displayTrip() {
        if let trip = tripOptional {
            // set tripCountLabel
            tripCountLabel.text = "Trip \(tripNumber!) of \(tripCount!)"
            destinationLabel.text = "Destination: \(trip.destinationName!)"
            startDateLabel.text = "Start Date: \(dateFormatter.string(from: trip.startDate!))"
            endDateLabel.text = "End Date: \(dateFormatter.string(from: trip.endDate!))"
            
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
