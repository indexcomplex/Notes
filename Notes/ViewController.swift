//
//  ViewController.swift
//  Notes
//
//  Created by Alan Hernandez on 8/2/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

import UIKit
import CoreData
//we need to access the UITableViewDelagate protocol to manipulate the text in the bars
class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    // we can set notes here but we can create them by using etitisies
    var notes = [Note]()
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        
        super.viewDidLoad()
       // loadNotes()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadNotes()
    }
        
        
    
    

    func loadNotes() {
        
        guard let appDelagate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelagate.persistentContainer.viewContext
        
        
        // fetch / request to core data to fetch perticular type of product
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
       
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            //fetch will return array we need to make sure they're note objects
            guard let notes = fetchedObjects as? [Note] else {return}
            //setting this notes ^ to the one on line 17
            self.notes = notes
            tableView.reloadData()
        }
        catch{
            print (error)
        }
        
        

        
    }
    
    
    @IBAction func didTapAdd(_ sender: Any) {
        
    
        
        performSegue(withIdentifier: "segue.Main.notesListToNoteEditor", sender: nil)
        
        
//        let alert = UIAlertController(title: "Add Message", message: nil, preferredStyle: .alert)
//        alert.addTextField()
//
//        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
//
//            //considering all the optionals we have to unwrap with guard
//            guard
//                let noteBody = alert.textFields?.first?.text,
//                let appDelagate = UIApplication.shared.delegate as? AppDelegate
//                else {return}
//
//            //we hve to access AppDelagate we have to do some unwrapping
//
//            let context = appDelagate.persistentContainer.viewContext
//
//            // this creates note
//            let newNote = Note(context: context)
//            newNote.body = noteBody // setting a string .body to the string of text from noteBody
//
//
//            appDelagate.saveContext()
//
//            //bc in closure we must referece self
//            // notes.append(newNote)
//           self.notes.append(newNote)
//           // we must also reload tableview dta
//            self.tableView.reloadData()
//        }
//        alert.addAction(saveAction)
//        present(alert, animated: true)
    }
    
    
    // to conform to UITableViewDataSource we need 2 func's
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let note = notes[indexPath.row]
        
         cell.textLabel?.text = note.body
        // you set to 0 so you get an inf num of lines and sets it to 1 everytime
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    // we can use bc UITableViewDelegate to make sure we selected the correct note to edit
    // uitableview delagate allows us to use this func
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //makes sure we have the correct note
        let note = notes[indexPath.row]
        
        
        let alert = UIAlertController(title: "Edit Note", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = note.body
        }
        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
            guard
                let updatedNoteBody = alert.textFields?.first?.text,
                let appDelagate = UIApplication.shared.delegate as? AppDelegate
                else {return}
            
            note.body = updatedNoteBody
            appDelagate.saveContext()
            
            self.loadNotes()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(updateAction)
        alert.addAction(cancelAction)
        
        // to fix Delay
        DispatchQueue.main.async {
            self.present(alert, animated: true)
            
        }
        
        
    }
    
    
    
}

