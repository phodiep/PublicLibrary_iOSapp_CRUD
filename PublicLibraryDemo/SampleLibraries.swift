//
//  SampleLibraries.swift
//  PublicLibraryDemo
//
//  Created by Pho Diep on 11/14/14.
//  Copyright (c) 2014 Pho Diep. All rights reserved.
//

//import Foundation

var shelf_DrSeuss = Shelf(name: "Dr. Seuss", booksOnShelf:[
    Book(title: "Green Eggs and Ham"),
    Book(title: "The Cat in the Hat"),
    Book(title: "The Lorax"),
    Book(title: "One Fish Two Fish Red Fish Blue Fish"),
    Book(title: "The 500 Hats of Bartholomew Cubbins"),
    Book(title: "Fox in Socks"),
    Book(title: "The King's Stilts"),
    Book(title: "Hop on Pop"),
    Book(title: "Thidwick the Big-Hearted Moose"),
    Book(title: "Horton Hatches the Egg"),
    Book(title: "Horton Hears a Who!"),
    Book(title: "How the Grinch Stole Christmas!")])


var shelf_HarryPotter = Shelf(name: "Harry Potter", booksOnShelf: [
    Book(title: "Harry Potter and the Philosopher's Stone"),
    Book(title: "Harry Potter and the Chamber of Secrets"),
    Book(title: "Harry Potter and the Prisoner of Azkaban"),
    Book(title: "Harry Potter and the Goblet of Fire"),
    Book(title: "Harry Potter and the Order of the Phoenix"),
    Book(title: "Harry Potter and the Half-Blood Prince"),
    Book(title: "Harry Potter and the Deathly Hallows")])

var shelf_USA = Shelf(name: "USA", booksOnShelf: [
    Book(title: "The USA Book"),
    Book(title: "Lonely Planet USA (Travel Guide)"),
    Book(title: "DK Eyewitness Travel Guide: USA")])

var shelf_Canada = Shelf(name: "Canada", booksOnShelf: [
    Book(title: "Top 10 Vancouver & Victoria"),
    Book(title: "Canada: The Big and Cold Country")])


var library_fiction = Library(name: "Fiction", shelves: [shelf_DrSeuss,shelf_HarryPotter])

var library_travel = Library(name: "Travel", shelves: [ shelf_USA, shelf_Canada])

//----------------------

var sampleLibraries = [library_travel, library_fiction]

//var LibraryViewSelection: Library = library_fiction
//var ShelfViewSelection: Shelf = shelf_DrSeuss
var libraryViewSelection_index: Int = 0
var shelfViewSelection_index: Int = 0
var bookViewSelection_index: Int = 0