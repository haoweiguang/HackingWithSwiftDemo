//
//  ContentView.swift
//  WordScramble
//
//  Created by 郝伟光 on 2024/6/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            
            if let fileContents = try?String(contentsOf: fileURL){
                let words = fileContents.components(separatedBy: "/n")
                
                let word=words.randomElement()
                
                let trimmed=word?.trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }
        

    }
}

#Preview {
    ContentView()
}
