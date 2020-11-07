//
//  Trip.swift
//  CPSC315PA6
//  This program stores information about the user's trips in a table view.
//  CPSC 315-02, Fall 2020
//  Programming Assignment #6
//  No sources to cite
//
//  Created by Gharin Pautz on 11/2/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import Foundation

/**
 This class is the backend, or model, of a Trip object.
 
 - Parameters:
    - destinationName: The destination name of the user's trip
    - startDate: The start date of the user's trip
    - endDate: The end date of the user's trip
 - Returns:
 */
class Trip: CustomStringConvertible {
    var destinationName: String
    var startDate = Date()
    var endDate = Date()
    
    var imageFileName: String?
    
    let dateFormatter = DateFormatter()
    
    var description: String {
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        return """
            Destination: \(destinationName)
            Start Date: \(dateFormatter.string(from: startDate))
            End Date: \(dateFormatter.string(from: endDate))
            """
    }
    
    /**
     Explicit initializer for the Trip class.
     
     - Parameters:
        - destinationName: The destination name of the user's trip
        - startDate: The start date of the user's trip
        - endDate: The end date of the user's trip
     - Returns: A new Trip object.
     */
    init(destinationName: String, startDate: Date, endDate: Date, imageFileName: String?) {
        self.destinationName = destinationName
        self.startDate = startDate
        self.endDate = endDate
        if let imageName = imageFileName {
            self.imageFileName = imageName
        }
        else {
            self.imageFileName = nil
        }
    }
    
    
}
