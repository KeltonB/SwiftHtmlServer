//
//  main.swift
//  HttpServer
//
//  Created by Kelton Bailey on 2/13/17.
//  Copyright © 2017 Kelton Bailey. All rights reserved.
//

import Foundation
var page = "<html> <b1> Test Page </b1> </html>"
var errpage = "<html> <b1> Code 400, your client has requested a page that does not exist! </b1> </html>"
var header = "HTTP/1.1 200 OK"
var req:String
print ("Init")
var l = log("log.txt")
if !isthere("config.yml"){
    write(file: "config.yml", value: "port: 8080 \nerrpage: <html><b1>Error</b1></html>")
}
var cfg = try! Yaml.load(read("config.yml"))
errpage = cfg["errpage"].string!
while(true){
var ms = try Socket.create()

    try ms.listen(on: cfg["port"].int!)
    try ms.acceptConnection()
    sleep(1)
    req = try ms.readString()!
    var a = parse(req)
    print(req)
    print("Conection accepted")
    l.log("New data:")
    l.log("Conection accepted")
    l.log(req)
    print(a[0])
    if a[0] == "GET"{
        if a[1] == "/"{
            print("Getting file: index.html 1")
            page = read("main.html")
            print("Sending page")
            l.log("Sending page")
            try ms.write(from: header)
            try ms.write(from: "\n")
            try ms.write(from: "\n")
            try ms.write(from: page)
        }else{
        
            do{
                print("Getting file:" + a[1] + ".html")
        page = try String(contentsOfFile: a[1] + ".html")
            }
            catch{
                page = read("main.html")
            }
        
            try! ms.write(from: header)
            try! ms.write(from: "\n")
            try! ms.write(from: "\n")
            try! ms.write(from: errpage)
        
        print("Args:")
        print(a)
    print("Sending page")
        l.log("Sending page")
     try! ms.write(from: header)
     try! ms.write(from: "\n")
     try! ms.write(from: "\n")
     try! ms.write(from: page)
    //ms.close()
        }}


/*
 ((try ms.readString()?.characters.count)! > 0)
 */
    }
