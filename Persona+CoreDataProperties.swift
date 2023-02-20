//
//  Persona+CoreDataProperties.swift
//  IneTest
//
//  Created by Jimena Reyes Reyes on 20/02/23.
//
//

import Foundation
import CoreData


extension Persona {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Persona> {
        return NSFetchRequest<Persona>(entityName: "Persona")
    }

    @NSManaged public var nombre: String?
    @NSManaged public var edad: Int64
    @NSManaged public var email: String?
    @NSManaged public var nombrePais: String?

}

extension Persona : Identifiable {

}
