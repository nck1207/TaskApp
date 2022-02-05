//
//  TaskViewController.swift
//  TasksApp
//
//  Created by Nikolas K. on 2/1/22.
//

import UIKit

class TaskViewController: UIViewController {
    //created label outlet
    @IBOutlet var label: UILabel!
    //string optional task variable which we assign our task content to before we push this controller on-screen
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        //set the labl's text to task
        label.text = task
        //created the delete button attached to deleteTask()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        
    }
    
    @objc func deleteTask() { //complicated further study
        //(See 36:58)because we have save these tasks with numbers (every time we save it increments an integer)
//          -decrement task count
//        let newCount = count - 1
//          -go into our user defaults and we can set  2 values and decrement the count of tasks
//        UserDefaults().setValue(newCount, forKey: "count")
            //set nil for the count of the current tasks hence currentPosition
//        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
            //when removing a task there is a need to shift the positions of the other existing tasks after it to avoid having an "empty slot"
        
    }
    

    

}
