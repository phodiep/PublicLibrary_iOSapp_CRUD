//
//  Public Library.swift
//  PublicLibrary
//
//  Created by Pho Diep on 11/12/14.
//  Copyright (c) 2014 Pho Diep. All rights reserved.
//
//  Challenge:
//  Use Swift to create object models for a public library
//  (w/ three classes: Library, Shelf, & Book).
//  The library should be aware of a number of shelves.
//  Each shelf should know what books it contains. Make the
//  book object have "enshelf" and "unshelf" methods that
//  control what shelf the book is sitting on. The library
//  should have a method to report all books it contains.
//  Push this file to your GitHub.com account and paste in
//  the URL to it here.

import Foundation

class Library {
    var name: String
    var shelves: [Shelf]
    
    init(name: String, shelves:[Shelf]) {
        self.name = name
        self.shelves = shelves
    }
    
    init(name: String, shelves: Shelf) {
        self.name = name
        self.shelves = [shelves]
    }
    
    init(name: String, shelfName: String, booksOnShelf: [Book]) {
        self.name = name
        self.shelves = [Shelf(name: shelfName, booksOnShelf: booksOnShelf)]
    }
    
    init(name: String, shelfName: String, booksOnShelf: Book) {
        self.name = name
        self.shelves = [Shelf(name: shelfName, booksOnShelf: [booksOnShelf])]
    }
    
    init(name: String) {
        self.name = name
        self.shelves = []
    }
    
    func numberOfShelves() -> Int {
        return shelves.count
    }
    
    func contents() -> [Book] {
        var libraryContents: [Book] = []
        for shelf in shelves {
            libraryContents += shelf.contents()
        }
        return libraryContents
    }
    
    func findBookOnShelf(bookToFind: Book) -> Shelf {
        var shelfLocation = Shelf(name: "")
        for shelf in shelves {
            for book in shelf.booksOnShelf {
                if book === bookToFind {
                    shelfLocation = shelf
                }
            }
        }
        return shelfLocation
    }
    
//    Correct placement of the enshelf and unshelf methods
//
    func libEnshelf(bookToShelve: Book, newShelf: Shelf) {
        newShelf.addBook(bookToShelve)
    }
    
    func libUnshelf(bookToUnshelve: Book) -> Shelf {
        var shelfBookCurrentlyOn = self.findBookOnShelf(bookToUnshelve)
        return shelfBookCurrentlyOn.removeBook(bookToUnshelve)
    }
    
}

class Shelf {
    var name: String
    var booksOnShelf: [Book]

    init(name: String, booksOnShelf: [Book]){
        self.name = name
        self.booksOnShelf = booksOnShelf
    }
    
    init(name: String, booksOnShelf: Book) {
        self.name = name
        self.booksOnShelf = [booksOnShelf]
    }
    
    init(name: String) {
        self.name = name
        self.booksOnShelf = []
    }

    func addBook(bookToAdd: Book) {
        booksOnShelf.append(bookToAdd)
    }
    
    func addBook(bookTitle: String) {
        booksOnShelf.append(Book(title: bookTitle))
    }
    
    func removeBook(bookToRemove: Book) -> Shelf {
        booksOnShelf = booksOnShelf.filter {$0 !== bookToRemove}
        return self
    }

    func removeBook(bookIndex: Int) {
        booksOnShelf.removeAtIndex(bookIndex)
    }
    
    func contents() -> [Book] {
        return booksOnShelf
    }
}


class Book {
    var title: String
    
    init(title: String) {
        self.title = title
        
    }
    
    init() {
        self.title = ""
    }
    
    // enshelf and unshelf should really belong of the Library class
    // but as per instructions they have been placed in the Book class
    // also written above
    
    func enshelf(newShelf: Shelf) {
        newShelf.addBook(self)
    }
    
    func unshelf(library: Library) -> Shelf {
        var shelfBookCurrentlyOn = library.findBookOnShelf(self)
        return shelfBookCurrentlyOn.removeBook(self)
    }
}



