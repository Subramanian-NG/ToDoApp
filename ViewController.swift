//
//  ViewController.swift
//  MidtermTest-iOS1
//
//  Created by Rania Arbash on 2023-02-23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var toDoTable: UITableView!
    
    var toDoArray = [ToDo]()
    
    var currentTask : ToDo = ToDo(t: "", f: false)
    
    @IBOutlet weak var todoText: UITextField!
    
    
    @IBOutlet weak var taskType: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell?
        if tableView.tag == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = toDoArray[indexPath.row].task
            if(toDoArray[indexPath.row].isUrgent)
            {
                cell?.textLabel?.textColor = UIColor.red
            }
            else
            {
                cell?.textLabel?.textColor = UIColor.green
                
            }
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = toDoArray[indexPath.row].task
            if(toDoArray[indexPath.row].isUrgent)
            {
                cell?.textLabel?.textColor = UIColor.red
            }
            else
            {
                cell?.textLabel?.textColor = UIColor.green
                
            }        }
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    @IBAction func saveNewToDo(_ sender: Any) {
       
        if let todo_text = todoText.text {
            if  (!todo_text.isEmpty && todo_text.count > 0) {
                currentTask.task = todo_text
                toDoArray.append(currentTask)
                todoText.text = ""
                taskType.setOn(false,animated: true)
                currentTask = ToDo(t: "", f: false)
                //print("new toDo added -\(todo_text)")
                toDoTable.reloadData()
            }
        }
    
    }
    
    
    @IBAction func onChangeType(_ sender: Any) {
        
        let selectedType = sender as! UISwitch
        if selectedType.isOn
        {
            currentTask.isUrgent = true
        }
        else
        {
            currentTask.isUrgent = false;
        }
        
    }
    
    
    
    
}

