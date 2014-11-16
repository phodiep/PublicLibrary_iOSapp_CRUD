//
//  BookViewController.swift
//  PublicLibraryDemo
//
//  Created by Pho Diep on 11/14/14.
//  Copyright (c) 2014 Pho Diep. All rights reserved.
//

import UIKit

class BookViewController: UITableViewController {
    
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.books = sampleLibraries[libraryViewSelection_index].shelves[shelfViewSelection_index].booksOnShelf
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns number of rows
        return self.books.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // returns cells
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var book : Book
        
        book = books[indexPath.row]
        
        cell.textLabel.text = book.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        removeBookFromShelf(indexPath.row)
        updateAndReload()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // returns book title as popup when selected
        
        let bookPopupController = UIAlertController(
            title: books[indexPath.row].title,
            message: books[indexPath.row].title,
            preferredStyle: .Alert)
        
        let doneAction = UIAlertAction(
            title: "Done",
            style: .Default,
            handler: nil)
        
        let editAction = UIAlertAction(
            title: "Edit",
            style: .Default) {
                (action: UIAlertAction!) -> Void in
                self.editTitleController(indexPath.row)
        }
        
        bookPopupController.addAction(doneAction)
        bookPopupController.addAction(editAction)
        
        presentViewController(
            bookPopupController,
            animated: true,
            completion: nil)

    }

    func editTitleController(indexPathRow: Int) {
        var editBookController = UIAlertController(
            title: "Edit Title",
            message: "Enter a new title",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(
            title: "Save",
            style: .Default) {
                (action: UIAlertAction!) -> Void in
                let textField = editBookController.textFields![0] as UITextField
                self.updateBookTitle(indexPathRow, newTitle: textField.text)
                self.updateAndReload()
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .Default) {
                (action: UIAlertAction!) -> Void in
        }
        
        editBookController.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        editBookController.addAction(saveAction)
        editBookController.addAction(cancelAction)
        
        presentViewController(
            editBookController,
            animated: true,
            completion: nil)
    }

    @IBAction func addBook(sender: AnyObject) {
        
        var newBookController = UIAlertController(
            title: "New Book",
            message: "Add a title",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(
            title: "Save",
            style: .Default) {
                (action: UIAlertAction!) -> Void in
                let textField = newBookController.textFields![0] as UITextField
                self.addBookToShelf(textField.text)
                self.updateAndReload()
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .Default) {
                (action: UIAlertAction!) -> Void in
        }
        
        newBookController.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        newBookController.addAction(saveAction)
        newBookController.addAction(cancelAction)
        
        presentViewController(
            newBookController,
            animated: true,
            completion: nil)
    }
    
    
    func updateAndReload() {
        self.books = sampleLibraries[libraryViewSelection_index].shelves[shelfViewSelection_index].booksOnShelf
        
        self.tableView.reloadData()
    }
    
    func addBookToShelf(bookTitle: String) {
        sampleLibraries[libraryViewSelection_index].shelves[shelfViewSelection_index].addBook(bookTitle)
    }
    
    func removeBookFromShelf(indexPathRow: Int){
        sampleLibraries[libraryViewSelection_index].shelves[shelfViewSelection_index].removeBook(indexPathRow)
    }
    
    func updateBookTitle(indexPathRow: Int, newTitle: String) {
        sampleLibraries[libraryViewSelection_index].shelves[shelfViewSelection_index].booksOnShelf[indexPathRow].title = newTitle
    }
}


