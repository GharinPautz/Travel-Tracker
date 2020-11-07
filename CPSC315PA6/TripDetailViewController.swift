//
//  TripDetailViewController.swift
//  CPSC315PA6
//
//  Created by Gharin Pautz on 11/4/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {

    var tripOptional: Trip? = nil
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
        if let trip = tripOptional {
            // set tripCountLabel
            destinationLabel.text = "Destination: \(trip.destinationName)"
            startDateLabel.text = "Start Date: \(dateFormatter.string(from: trip.startDate))"
            endDateLabel.text = "End Date: \(dateFormatter.string(from: trip.endDate))"
            
            if let imageName = trip.imageFileName {
                tripImageView.image = UIImage(named: imageName)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func initializeDateFormatter() {
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
}
