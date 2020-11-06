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
    
    init(destinationName: String, startDate: Date, endDate: Date) {
        self.destinationName = destinationName
        self.startDate = startDate
        self.endDate = endDate
        //self.imageFileName = "image"
    }
    
}
