//
//  ViewController.swift
//  PublicLibraryDemo
//
//  Created by Pho Diep on 11/14/14.
//  Copyright (c) 2014 Pho Diep. All rights reserved.
//

import UIKit

class LibraryViewController: UITableViewController {

    var libraries = [Library]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.libraries = sampleLibraries
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns number of rows
        return self.libraries.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // returns cells
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var library : Library
        
        library = libraries[indexPath.row]
        
        cell.textLabel.text = library.name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        libraryViewSelection_index = indexPath.row
    }
    
    

}

