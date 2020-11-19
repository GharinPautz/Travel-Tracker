//
//  Trip+CoreDataProperties.swift
//  CPSC315PA7
//
//  Created by Gharin Pautz on 11/17/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var destinationName: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var imageFileName: String?

}
