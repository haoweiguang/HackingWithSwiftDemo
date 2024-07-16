//
//  ExpenseItem.swift
//  iExpense
//
//  Created by 郝伟光 on 2024/7/9.
//

import Foundation

struct ExpenseItem:Identifiable,Codable{
    var id = UUID()
    let name:String
    let type:String
    let amount:Double
}
