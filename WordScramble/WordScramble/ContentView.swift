//
//  ContentView.swift
//  WordScramble
//
//  Created by 郝伟光 on 2024/6/9.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords=[String]()
    @State private var rootWord=""
    @State private var newWord=""
    
    @State private var errorTitle=""
    @State private var errorMessage=""
    @State private var showError=false
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Enter your word",text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section{
                    ForEach(usedWords,id:\.self){ word in
                        Image(systemName: "\(word.count).circle")
                        Text(word)
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform:startGame)
            .onAppear(perform:firstIndex)
            .alert(errorTitle,isPresented: $showError){
                Button("OK"){}
            } message: {
                Text(errorMessage)
            }
            .toolbar{
                Button("startGame",action: startGame)
            }
        }

    }
    
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count>0 else {return}
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            print("rootWord \(rootWord)")
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else{
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func startGame(){
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try?String(contentsOf: startWordsURL){
                let allWords = startWords.components(separatedBy: "/n")
                
                rootWord = allWords.randomElement() ?? "silkworm"
                
                return
            }
        }
        
        fatalError("Can not load start.txt from bundle")
    }
    
    func isOriginal(word:String)->Bool{
        print("usedWords \(usedWords)")
        return !usedWords.contains(word)
    }
    
    func isPossible(word:String)->Bool{
        var tempWord=rootWord
        
        for letter in word {
            if let pos=tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
                print("tempWord \(tempWord)")
            }else{
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title:String,message:String){
        errorTitle=title
        errorMessage=message
        showError=true
    }
}



#Preview {
    ContentView()
}
