//
//  ToDoItem.swift
//  CoreDataToDo
//
//  Created by Greg Hughes on 2/20/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem : NSManagedObject, Identifiable {
    
    @NSManaged public var createdAt: Date?
     @NSManaged public var title: String?
    
    
    
    
    
}

extension ToDoItem {
    
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        
        let request : NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
