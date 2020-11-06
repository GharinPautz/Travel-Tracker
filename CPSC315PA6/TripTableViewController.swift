//
//  ViewController.swift
//  CPSC315PA6
//
//  Created by Gharin Pautz on 10/26/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class TripTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var trips = [Trip]()
    
    @IBOutlet var tableView: UITableView!
    
    var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeDateFormatter()
        initializeTrips()
        print(trips)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return trips.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let trip = trips[row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripTableViewCell
        
        cell.update(with: trip)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifer = segue.identifier {
            if identifer == "DetailSegue" {
                if let tripDetailVC = segue.destination as? TripDetailViewController {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let trip = trips[indexPath.row]
                        tripDetailVC.tripOptional = trip
                    }
                }
            }
        }
    }
    
    func initializeTrips() {
        trips.append(Trip(destinationName: "Hawaii", startDate: dateFormatter.date(from: "12/23/2020")!, endDate: dateFormatter.date(from: "12/30/2020")!))
        trips.append(Trip(destinationName: "Copenhagen", startDate: dateFormatter.date(from: "08/05/2020")!, endDate: dateFormatter.date(from: "08/22/2020")!))
        trips.append(Trip(destinationName: "Florence", startDate: dateFormatter.date(from: "09/13/2020")!, endDate: dateFormatter.date(from: "09/25/2020")!))
    }

    func initializeDateFormatter() {
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
}

