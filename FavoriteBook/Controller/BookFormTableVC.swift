//
//  BookFormTableVC.swift
//  FavoriteBooks
//
//  Created by ronny abraham on 12/5/17.
//

import UIKit

class BookFormTableVC: UITableViewController {

    var book: Book?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    
    
    struct PropertyKeys {
        static let unwind = "UnwindToBookTable"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        updateView()
    }
    
    func updateView() {
        guard let book = book else { return }
        
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
        
    }

    @IBAction func saveTheBook(_ sender: Any) {
        
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            let genre = genreTextField.text,
            let length = lengthTextField.text else {return}
        
        book = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
    }
}
