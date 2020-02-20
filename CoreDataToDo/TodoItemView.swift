//
//  TodoItemView.swift
//  CoreDataToDo
//
//  Created by Greg Hughes on 2/20/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import SwiftUI

struct TodoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(title: "My great TODO", createdAt: "Today")
    }
}
