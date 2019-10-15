//
//  NoteEditorVC.swift
//  Notes
//
//  Created by Alan Hernandez on 10/14/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

import UIKit

class NoteEditorVC: UIViewController {

    //textView

    
    @IBOutlet weak var noteTV: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        //Action up here will be called when we hit done
        navigationItem.rightBarButtonItem = doneBarButtonItem
    
  
        
        
        
        
    
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // calls text view keyboard asap
        noteTV.becomeFirstResponder()
        
        
    }
    @objc func didTapDone() {
        print("done")
        
        guard let appDelagate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let context = appDelagate.persistentContainer.viewContext
        
                    // this creates note
                    let newNote = Note(context: context)
                    newNote.body = noteTV.text
                    appDelagate.saveContext()
        
                // to save
        // To pop the top VC and go back to the previous menu
        navigationController?.popViewController(animated: true)
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
}
