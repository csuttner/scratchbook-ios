//
//  TableViewController.swift
//  bd_appdelegate_stb
//
//  Created by Clay Suttner on 11/24/19.
//  Copyright © 2019 skite. All rights reserved.
//

import UIKit

var fileIndex = 0

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        self.title = "Open Existing File"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        cell.textLabel?.text = fileList[indexPath.row]![0]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fileIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}
