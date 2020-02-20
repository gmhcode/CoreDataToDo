//
//  ContentView.swift
//  CoreDataToDo
//
//  Created by Greg Hughes on 2/20/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("What's Next")) {
                    HStack {
                        TextField("New Item", text: self.$newTodoItem)
                        Button(action: {
                            
                            
                            
                            let todoItem = ToDoItem(context: self.managedObjectContext)
                            todoItem.title = self.newTodoItem
                            todoItem.createdAt = Date()
                            
                            
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            
                            self.newTodoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To Do's")) {
                    ForEach(self.toDoItems) {todoItem in
                        TodoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                    }.onDelete {IndexSet in
                        let deleteItem = self.toDoItems[IndexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        }catch {
                            print(error)
                        }
                        
                    }
                    
                }
                
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
