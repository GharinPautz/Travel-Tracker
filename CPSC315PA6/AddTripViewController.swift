//
//  AddTripViewController.swift
//  CPSC315PA6
//
//  Created by Gharin Pautz on 11/6/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    var tripOptional: Trip? = nil
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
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                print("In save unwind segue")
                if let destination = destinationTextField.text, let startDate = startDateTextField.text, let endDate = endDateTextField.text {
                    
                        tripOptional = Trip(destinationName: destination, startDate: dateFormatter.date(from: startDate)!, endDate: dateFormatter.date(from: endDate)!)
                }
            }
        }
    }
    
    func initializeDateFormatter() {
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
}
