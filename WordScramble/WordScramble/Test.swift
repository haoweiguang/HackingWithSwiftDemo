//
//  File.swift
//  WordScramble
//
//  Created by 郝伟光 on 2024/6/13.
//

import Foundation

func firstIndex()
{
    let rootWord = "apple"
    var tempWord = rootWord
    
    if let pos = rootWord.firstIndex(of: "a"){
        let posIndex = rootWord.distance(from: rootWord.startIndex, to: pos)
        print("pos is \(posIndex)")
        
        tempWord.remove(at: pos)
        print("tempWord \(tempWord)")
    }
    
    
    
    if let pos1 = rootWord.firstIndex(of: "l"){
        let posIndex1 = rootWord.distance(from: rootWord.startIndex, to: pos1)
        print("pos is \(posIndex1)")
        
        tempWord.remove(at: pos1)
        print("tempWord \(tempWord)")
    }
}

// 定义一个全局函数
func greet(name: String) -> String {
    return "Hello, \(name)!"
}
