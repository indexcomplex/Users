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
    
    var users = [User]()
    
    
    
    

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
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as?
                        [[String: Any]] else {return}
                    
                    // making an array to hold users
                    var users = [User]()
                    
                    //parsing turns into in an object , access diff values
                    for userDictionary in json{
                        
                       guard
                            let name = userDictionary["name"] as? String,
                            let address = userDictionary["address"] as? [String: Any],
                            let city = address["city"] as? String
                            else {return}
                      
                        
                        let user = User(name: name, city: city)
                        users.append(user)
                        
                    }
                    print(users)
                    self.users = users
                    DispatchQueue.main.async {
                         self.tableView.reloadData()
                    }
                    
                   
                    
                    
                    
                } catch let err {
                    print(err)
                    
                }
                
                
                
            }
            
            
        }
        
        dataTask.resume()
        
        
    }
    
    
    

    //changed from the hard coded ussers we had to objects of users below
    
    // gets the number of rows you need to be printed
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    // lookin to return a cell
    // index path gets back the row / info you have
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.city
        
        return cell
        
    }
    
    


}
