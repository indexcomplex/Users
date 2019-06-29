//
//  UsersVC.swift
//  Users
//
//  Created by Alan Hernandez on 6/28/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

import UIKit

class UsersVC: UITableViewController {
    
    
    let temporaryUsers = ["Alan", "Jessica", "Kyle L.", "Kyle M.", "Steven" ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hi")

    
    }
    // gets the number of rows you need to be printed
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temporaryUsers.count
    }
    
    // lookin to return a cell
    // index path gets back the row / info you have
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = temporaryUsers[indexPath.row]
        cell.textLabel?.text = user
        
        return cell
        
    }
    
    


}
