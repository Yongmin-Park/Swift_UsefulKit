//
//  FileManager.swift
//  Chording
//
//  Created by YMP on 27/10/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation

class FileManager{
    func linesFromResource(fileName: String) -> [String] {
        guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else {
            fatalError("Resource file for \(fileName) not found.")
        }
        do {
            let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return content.components(separatedBy: "\n")
        } catch let error {
            fatalError("Could not load strings from \(path): \(error).")
        }
    }
    
    func linesFromResourceForced(fileName: String) -> [String] {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        let content = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
        return content.components(separatedBy: "\n")
    }
    
    func arrayFromContentsOfFileWithName(fileName: String) -> [String]? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else {
            return nil
        }
        
        do {
            let content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
            return content.components(separatedBy: "\n")
        } catch _ as NSError {
            return nil
        }
    }
    
    func SetWordsFrom(fileName: String) -> [String]{
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        let content = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
        return content.components(separatedBy: "\n")
    }
    
    func ReadTextfileByLine(filename: String, seperatedBy: String) -> String{
        if let path = Bundle.main.path(forResource: filename, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                return myStrings.joined(separator: seperatedBy)//seperated by comma
            } catch let error{
                fatalError("Could not load strings from \(path): \(error).")
            }
        }
    }
}
