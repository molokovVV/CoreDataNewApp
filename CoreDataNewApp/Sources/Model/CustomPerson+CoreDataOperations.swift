//
//  CustomPerson+CoreDataOperations.swift
//  CoreDataNewApp
//
//  Created by Виталик Молоков on 11.04.2023.
//

import Foundation
import CoreData

extension CustomPerson {

    static func createPerson(name: String, birthDate: Date, gender: String, imageData: Data, in context: NSManagedObjectContext) -> CustomPerson? {
        guard let entity = NSEntityDescription.entity(forEntityName: "Person", in: context) else {
            return nil
        }
        
        let person = CustomPerson(entity: entity, insertInto: context)
        person.name = name
        person.birthDate = birthDate
        person.gender = gender
        person.imageData = imageData

        return person
    }
    
    static func fetchAll(in context: NSManagedObjectContext) -> [CustomPerson] {
        let fetchRequest: NSFetchRequest<CustomPerson> = CustomPerson.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            print("Failed to fetch persons: \(error.localizedDescription)")
            return []
        }
    }
    
    func delete(in context: NSManagedObjectContext) {
        context.delete(self)
    }
}
