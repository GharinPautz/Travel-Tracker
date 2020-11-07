//
//  AddTripViewController.swift
//  CPSC315PA6
//  This program stores information about the user's trips in a table view.
//  CPSC 315-02, Fall 2020
//  Programming Assignment #6
//  No sources to cite
//
//  Created by Gharin Pautz on 11/6/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

/**
 This class is the view controller for the screen where the user can add new trips.
 
 - Parameters:
    - tripOptional: The trip object where data is stored when grabbed from textfields
    - tripCount: the total count of trips
    - dateFormatter: The DateFormatter object used to format the dates
 - Returns: None
 */
class AddTripViewController: UIViewController, UITextFieldDelegate {

    var tripOptional: Trip? = nil
    var tripCount: Int = 0
    var dateFormatter = DateFormatter()
    
    @IBOutlet var tripNumberLabel: UILabel!
    @IBOutlet var destinationTextField: UITextField!
    @IBOutlet var startDateTextField: UITextField!
    @IBOutlet var endDateTextField: UITextField!
    
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeDateFormatter()
        tripNumberLabel.text = "Trip #\(tripCount)"
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /**
     Stores data in the text fields to a new Trip object to be added to the trips array
     
     - Parameters:
        - segue: The segue that is about to be performed
        - sender:
     - Returns: None
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                print("In save unwind segue")
                if let destination = destinationTextField.text, let startDate = startDateTextField.text, let endDate = endDateTextField.text {
                        
                        // check that destination is not empty
                        // check that start date is valid date
                        // check that end date is valid date
                    tripOptional = Trip(destinationName: destination, startDate: dateFormatter.date(from: startDate)!, endDate: dateFormatter.date(from: endDate)!, imageFileName: nil)
                }
            }
        }
    }
    
    /**
     Function that determines whether a segue should perform
     
     - Parameters:
        - identifier
        - sender
     - Returns: True if segue should perform, false otherwise
     */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "SaveUnwindSegue" {
            guard let destinationStr = destinationTextField.text, destinationStr != "" else {
                let alertController = UIAlertController(title: "Enter Destination", message: "You did not enter a destination.", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) -> Void in
                    print("Okay pressed in enter destination")
                    
                    
                }))
                
                present(alertController, animated: true, completion: { () -> Void in
                    print("Alert just presented")
                })
                return false
            }
            
            guard let startDateStr = dateFormatter.date(from: startDateTextField.text!) else {
                
                let alertController = UIAlertController(title: "Incorrect Date Format", message: "The date you entered is not the correct format.", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) -> Void in
                    print("Okay pressed from date dialog")
                    self.startDateTextField.text = ""
                }))
                
                present(alertController, animated: true, completion: { () -> Void in
                    print("Alert just presented")
                })
                
                return false
            }
            
            guard let endDateStr = dateFormatter.date(from: endDateTextField.text!) else {
                
                let alertController = UIAlertController(title: "Incorrect Date Format", message: "The date you entered is not the correct format.", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) -> Void in
                    print("Okay pressed from date dialog")
                    self.endDateTextField.text = ""
                }))
                
                present(alertController, animated: true, completion: { () -> Void in
                    print("Alert just presented")
                })
                
                return false
            }
        }
        
        return true
    }
    
    /**
     Allows keyboard to resign as first responder (disappear) when background is tapped
     
     - Parameters: sender is the background tap
     - Returns: None
     */
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer) {
        print("background tap")
        destinationTextField.resignFirstResponder()
        startDateTextField.resignFirstResponder()
        endDateTextField.resignFirstResponder()
    }
    
    /**
     Allows keyboard to disappear when return key is pressed.
     
     - Parameters: textField is the textField that is being used
     - Returns: true if return is tapped
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
