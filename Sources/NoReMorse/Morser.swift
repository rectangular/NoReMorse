//
//  NoReMorse.swift
//
//
//  Created by Geof Crowl on 1/8/21.
//

import Foundation

public class Morser {
    
    var letterSeparator: Character
    var wordSeparator: Character
    
    var dot: Character
    var dash: Character
    
    public init(letterSeparator: Character = " ", wordSeparator: Character = "/", dot: Character = ".", dash: Character = "-") {
        
        self.letterSeparator = letterSeparator
        self.wordSeparator = wordSeparator
        self.dot = dot
        self.dash = dash
    }
    
    public func translate(_ morse: String) -> String {
        
        return parse(lex(morse))
    }
    
    private func lex(_ inputStr: String) -> [String] {
        
        var blocks = [String]()
        
        var buffer: String? = nil
        
        for (index, c) in inputStr.enumerated() {
            
            let c = c as Character
            
            switch c {
            
            case letterSeparator:
                if let buffer = buffer {
                    blocks.append(buffer)
                }
                buffer = nil
                
            case wordSeparator:
                blocks.append(" ")
            
            case dot:
                if buffer == nil { buffer = "" }
                buffer?.append(c)
                
            case dash:
                if buffer == nil { buffer = "" }
                buffer?.append(c)
                
            default:
                print("Error with \(c) at \(index)")
            }
            
            if index == inputStr.count - 1, let buffer = buffer {
                blocks.append(buffer)
            }
            
        }
        
        return blocks
    }
    
    private func parse(_ lexBlocks: [String]) -> String {
        
        let t = Translator()
        var translatedBlocks: String = ""
        
        for block in lexBlocks {
            
            if block == " " {
                
                translatedBlocks.append(" ")
                
            } else if let translated = t.morse[block] {
                
                translatedBlocks.append(translated)
            }
        }
        
        return translatedBlocks
    }
}
