//
//  ViewController.swift
//  bd_appdelegate_stb
//
//  Created by Clay Suttner on 11/22/19.
//  Copyright © 2019 skite. All rights reserved.
//

import UIKit

var fileList = [0 : ["",""], 1 : ["",""], 2 : ["",""], 3 : ["",""], 4 : ["",""], 5 : ["",""]]

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        var counter = 0
        
        super.viewDidLoad()
        self.title = "Welcome to scratchBook!"

        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("Library.bundle")

        do {
            let contents = try fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])

          for item in contents
          {
            if item.lastPathComponent != "Contents.json" {
                let str = item.lastPathComponent
                let firstDot = str.firstIndex(of: ".") ?? str.endIndex
                let prevIndex = str.index(before: firstDot)
                let fileName = String(str[...prevIndex])
                let filePath = item.appendingPathComponent(fileName + ".txt")
                let fileContents = try String(contentsOf: filePath)
                
                fileList[counter] = [fileName, fileContents]
                counter += 1
            }
          }
        }
        catch let error as NSError {
          print(error)
        }
        
    }
    
}

