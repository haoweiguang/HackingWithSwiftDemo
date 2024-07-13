//
//  DeletingItemsView.swift
//  iExpense
//
//  Created by 郝伟光 on 2024/7/6.
//

import SwiftUI

struct DeletingItemsView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        VStack{
            List{
                ForEach(numbers,id: \.self){
                    Text("Row \($0)")
                }
            }
        }
        
        Button("Add Number"){
            numbers.append(currentNumber)
            currentNumber+=1
        }
    }
}

#Preview {
    DeletingItemsView()
}
