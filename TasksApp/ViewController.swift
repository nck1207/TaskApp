//
//  ViewController.swift
//  TasksApp
//
//  Created by Nikolas K. on 2/1/22.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    //Tableview
    @IBOutlet var tableView: UITableView!
    
    //array created to hold all tasks
    var tasks = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        //assigned tableview delegate and datasource and a title above
        tableView.delegate = self
        tableView.dataSource = self
        
        //MARK: Setup
        //uses userdefaults to save items instead of database
        //created this initial setup block to make sure that we start off with the count of 0
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
            
        }
        
        
        // Get all currents saved tasks
        //we call this function every time we start the app and has viewcontroller to update our tasks array from whatever we saved 41-58
        updateTasks()
    }
    
    func updateTasks() {
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
                tasks.append(task)
            }
            
        }
        
        tableView.reloadData()
    }
    //called when we click on te "add" button using interface builder 60-69
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }

}
//delegate function itself for the tableview which is what happens when we select a cell
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //on click view controller is created and assign it a task
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        vc.title = "New Task"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
//datasource functions which supplies the number of rows which is a number of things in tasks as well as a cell
extension ViewController: UITableViewDataSource {
    //return number of things we put in our tasks
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    //returns the cell for the given row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //used to "DQ" a cell see video @8:38
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell 
    }
    
}

//MARK: StoryBoard Notes
/*
 -navigation controller (.ViewController)
    -list view controller with table view
 -entry view controller (.EntryViewController
    -text feild used to enter new tasks
 -task view controller (TaskViewController)
    -label used to show entries
 */
