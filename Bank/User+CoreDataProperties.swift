//
//  User+CoreDataProperties.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var email: String?

}

