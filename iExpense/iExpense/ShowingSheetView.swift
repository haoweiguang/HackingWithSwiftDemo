//
//  ShowingSheet.swift
//  iExpense
//
//  Created by 郝伟光 on 2024/7/9.
//

import SwiftUI

struct ShowingSheetView: View {
    @State private var showingSheet=false
    
    var body: some View {
        Button("Show Sheet"){
            showingSheet.toggle()
        }
        .sheet(isPresented:$showingSheet){
            SecondView(name: "@twostraws")
        }
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name:String
    
    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ShowingSheetView()
}
