//
//  Trip.swift
//  CPSC315PA6
//
//  Created by Gharin Pautz on 11/2/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import Foundation

class Trip: CustomStringConvertible {
    var destinationName: String
    var startDate = Date()
    var endDate = Date()
    //var imageFileName: String?
    var description: String {
        return """
            Destination: \(destinationName)
            Start Date: \(startDate)
            End Date: \(endDate)
            """
    }
    
    init(destinationName: String, startDate: String, endDate: String) {
        self.destinationName = destinationName
        self.startDate = setDate(date: startDate)
        self.endDate = setDate(date: endDate)
        //self.imageFileName = "image"
    }
    
    // or we can change the return value to be Date? and return nil in the else statement
    func setDate(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let todayStr = dateFormatter.string(from: startDate)
        if let tripDate = dateFormatter.date(from: date) {
            return tripDate
        }
        else {
            return startDate
        }
    }
}
