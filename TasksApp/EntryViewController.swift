//
//  EntryViewController.swift
//  TasksApp
//
//  Created by Nikolas K. on 2/1/22.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate{
    //field outlet
    @IBOutlet var field: UITextField!
    //a closure called update which is nothing returning void
    var update: (() -> Void)?
    //setting the delegate on the field
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        //created a button for the person to tap done when they are entering
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    //once a person hits return on the keyboard it will add their task if there is somthing entered my running the "savetask() function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
        
    }
    //no need for @IBAction since storyboard is not used
    
    @objc func saveTask() {
        //makes sure that we have text entered and that it isnt empty
        guard let text = field.text, !text.isEmpty else{
            return
        }
        //makes sure that we have a count and increments the count
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        //saves the new count as well as the task
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        //calls the update function if it exists
        update?()
        //dismisses the view controller 
        navigationController?.popViewController(animated: true)
    }
    
}
