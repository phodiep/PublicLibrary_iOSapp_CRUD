//
//  ShelfViewController.swift
//  PublicLibraryDemo
//
//  Created by Pho Diep on 11/14/14.
//  Copyright (c) 2014 Pho Diep. All rights reserved.
//

import UIKit

class ShelfViewController: UITableViewController {

    var shelves = [Shelf]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shelves = sampleLibraries[libraryViewSelection_index].shelves

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns number of rows
        return self.shelves.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // returns cells
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var shelf : Shelf
        
        shelf = shelves[indexPath.row]
        
        cell.textLabel.text = shelf.name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        shelfViewSelection_index = indexPath.row
    }

}
