//
//  Config.swift
//  HttpServer
//
//  Created by Kelton Bailey on 2/13/17.
//  Copyright © 2017 Kelton Bailey. All rights reserved.
//
import Cocoa
func create(_ a:String){
    let fileManager = FileManager.default
    let path = fileManager.currentDirectoryPath
    print(path)
    try! "".write(toFile: path + "/" + a, atomically: true, encoding: .utf8)
}
func write(file:String, value:String){
    let fileManager = FileManager.default
    let path = fileManager.currentDirectoryPath
    print(path)
    try! value.write(toFile: path + "/" + file, atomically: true, encoding: .utf8)
}
func read(_ a:String) -> String{
    let fileManager = FileManager.default
    let path = fileManager.currentDirectoryPath
    print(path + "/" + a)
    var rtn = ""
    do{
    rtn = try! String(contentsOfFile:  path + "/" + a, encoding: .utf8)
    return rtn
    print (rtn)
    }
    catch{
        return ""
    }
    
    }
func isthere(_ a:String) -> Bool{
    let fileManager = FileManager.default
    let path = fileManager.currentDirectoryPath
    do{
        _ = try String(contentsOfFile: path + a, encoding: .utf8)
        return true
    }
    catch{
        return false
    }
}




class log{
    var name:String
    init(_ a:String){
        do{
        name = a
        try _ = String(contentsOfFile: name)
        }
        catch{
            create(name)
        }
    }
    func log(_ a:String){
    let old = read(name)
    let new = old + " " + a
        write(file: name, value: new)
    }
}
