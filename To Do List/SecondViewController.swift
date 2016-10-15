//
//  SecondViewController.swift
//  To Do List
//
//  Created by Hugo Morelli on 9/29/16.
//  Copyright © 2016 Hugo Morelli. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var itemTextfield: UITextField!
    
    //MARK: Actions
    @IBAction func addItem(_ sender: AnyObject) {
        
        let itemObject = UserDefaults.standard.object(forKey: "items")
        var items: [String]
        if  let tempItems =  itemObject as? [String]{
            
            items = tempItems
            
            items.append(itemTextfield.text!)
            
        } else {
            
            items = [itemTextfield.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        itemTextfield.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

