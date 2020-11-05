//
//  ViewController.swift
//  CPSC315PA6
//
//  Created by Gharin Pautz on 10/26/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class TripTableViewController: UIViewController {
    
    var trips = [Trip]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeTrips()
        print("trips \(trips)")
    }
    
    func initializeTrips() {
        trips.append(Trip(destinationName: "Hawaii", startDate: "12/23/2020", endDate: "12/30/2020"))
    }


}

