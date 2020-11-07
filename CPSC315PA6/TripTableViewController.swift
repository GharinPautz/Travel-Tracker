//
//  ViewController.swift
//  CPSC315PA6
//  This program stores information about the user's trips in a table view.
//  CPSC 315-02, Fall 2020
//  Programming Assignment #6
//  No sources to cite
//
//  Created by Gharin Pautz on 10/26/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

/**
 View controller for the initial screen of the app that stores the table view
 
 - Parameters:
    - trips: an array of Trip objects
    - tableView: the table view object
    - dateFormatter: the DateFormatter object being used to format dates
 - Returns: None
 */
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
    
    /**
    Method for UITableViewDelegate protocol
    
    - Parameters:
        - tableView: the table view object
        - numberOfRowsInSection: the number of rows
    - Returns: An integer representing the number of cells in table
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return trips.count
        }
        return 0
    }
    
    /**
     Method for UITableViewDelegate protocol
     
     - Parameters:
        - tableView: the table view object
        - indexPath: the selected row
     - Returns: A  cell in the table
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let trip = trips[row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripTableViewCell
        
        cell.update(with: trip)
        return cell
    }
    
    /**
     The method for moving a row from one position to another
     
     - Parameters:
        - tableView: the table view object
        - sourceIndexPath: the initial row position
        - destinationIndexPath: the new row position
     - Returns: None
     */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let trip = trips.remove(at: sourceIndexPath.row)
        trips.insert(trip, at: destinationIndexPath.row)
        
        tableView.reloadData()
    }
    
    /**
     The tableview method for removing a row in the table when deleted
     
     - Parameters:
        - tableView: The tableView object
        - editingStyle: the editing style
        - indexPath: The row in the table
     - Returns: None
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        trips.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
    }
    
    /**
     Function to prepare for a segue to either of the next 2 screens
     
     - Parameters:
        - segue: The segue about to be performed
        - sender: the sender
     - Returns: None
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "DetailSegue" {
                if let tripDetailVC = segue.destination as? TripDetailViewController {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let trip = trips[indexPath.row]
                        tripDetailVC.tripOptional = trip
                        tripDetailVC.tripCount = trips.count
                        tripDetailVC.tripNumber = indexPath.row
                    }
                }
            }
            else if identifier == "AddTripSegue" {
                print("made it to add segue")
                if let addTripVC = segue.destination as? AddTripViewController {
                    print("tripCount: \(trips.count + 1)")
                    addTripVC.tripCount = trips.count + 1
                    
                }
                if let indexPath = tableView.indexPathForSelectedRow {
                    // deselect the row
                    tableView.deselectRow(at: indexPath, animated: true)
                }
            }
        }
    }
    
    // need to add a new row in table
    @IBAction func unwindToTripTableVC(segue: UIStoryboardSegue) {
        if let identifier = segue.identifier {
            // if save was pressed
            if identifier == "SaveUnwindSegue" {
                print("Save pressed")
                if let addTripVC = segue.source as? AddTripViewController {
                    if let trip = addTripVC.tripOptional {
                        // unwinding from add segue
                        trips.append(trip)
                        tableView.reloadData()
                    }
                }
            }
            // if cancel was pressed
        }
    }
    
    /**
     Toggle the editing mode for Trip Table View Controller
     
     - Parameters: sender is the UIBarButtonItem that the user presses titled "edit"
     - Returns: None
     */
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        let newEditingMode = !tableView.isEditing
        tableView.setEditing(newEditingMode, animated: true)
    }
    
    /**
     Initializes original 5 trips to populate the app
     
     - Parameters: None
     - Returns: None
     */
    func initializeTrips() {
        trips.append(Trip(destinationName: "Hawaii", startDate: dateFormatter.date(from: "12/23/2020")!, endDate: dateFormatter.date(from: "12/30/2020")!, imageFileName: "hawaii"))
        trips.append(Trip(destinationName: "Copenhagen", startDate: dateFormatter.date(from: "08/05/2020")!, endDate: dateFormatter.date(from: "08/22/2020")!, imageFileName: "copenhagen"))
        trips.append(Trip(destinationName: "Florence", startDate: dateFormatter.date(from: "09/13/2020")!, endDate: dateFormatter.date(from: "09/25/2020")!, imageFileName: "florence"))
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

