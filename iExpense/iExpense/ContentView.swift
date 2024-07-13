//
//  ContentView.swift
//  iExpense
//
//  Created by 郝伟光 on 2024/7/6.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses=Expenses()
    @State private var showingAddExpense=false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(expenses.items,id:\.name){item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("IExpense")
            .toolbar{
                Button("Add Expense",systemImage: "plus"){
//                    let expense=ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                    showingAddExpense=true
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets:IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}



#Preview {
    ContentView()
}
