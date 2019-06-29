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
        getUsers()
    }
    
    // Networking Request
    func getUsers(){
        
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else
        {return}
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error)
            in
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                //quick 3digit nubmer good is 200 fail is 404
                
            }
            if let error = error{
                print(error)
            }else if let data = data{
                print(data)
                
               // let dataString = String(data: data, encoding: .utf8)
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                    
                    
                } catch let err {
                    print(err)
                    
                }
                
                
                
            }
            
            
        }
        
        dataTask.resume()
        
        
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
