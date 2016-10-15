//
//  FirstViewController.swift
//  To Do List
//
//  Created by Hugo Morelli on 9/29/16.
//  Copyright © 2016 Hugo Morelli. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    //MARK Properties
    @IBOutlet weak var table: UITableView!
    
    var items: [String] = []

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return items.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
    
 
        cell.textLabel?.text  = items[indexPath.row]
        return cell

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        let itemObject = UserDefaults.standard.object(forKey: "items")
        
        if  let tempItems =  itemObject as? [String]{
            items = tempItems
            
        }
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(items, forKey: "items")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

