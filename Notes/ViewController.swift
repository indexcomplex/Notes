//
//  ViewController.swift
//  Notes
//
//  Created by Alan Hernandez on 8/2/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var notes = ["hello", "bye"]
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    
    @IBAction func didTapAdd(_ sender: Any) {
        print("add")
        
    }
    
    
    // to conform to UITableViewDataSource we need 2 func's
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let note = notes[indexPath.row]
        
         cell.textLabel?.text = note
        
        return cell
    }
    
    
    
    
    
}

