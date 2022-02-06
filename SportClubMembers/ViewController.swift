//
//  ViewController.swift
//  SportClubMembers
//
//  Created by star on 05.02.22.
//

import UIKit

class ViewController: UIViewController {

    var persons = ["Starsky", "Annika", "Silvi!", "Alwin", "Ramzi", "Janina", "Baris"]
    
    //MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
        title = "Members"
        
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(!isEditing, animated: true)
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    //MARK: - Add new members

    @IBAction func addButtonTapped(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Member", message: "Please enter Name", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Member", style: .default) { (action) in
            if textField.text == "" || textField.text == nil {
                return
            } else {
                self.persons.insert(textField.text!, at: 0)
                
                let indexPath = IndexPath(row: 0, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .left)
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Name"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = persons[indexPath.row]
        
        return cell
    }
    
    
}
    

extension ViewController: UITableViewDelegate {
    //MARK: - Edit TableView
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let selectedPerson = persons[sourceIndexPath.row]
        persons.remove(at: sourceIndexPath.row)
        persons.insert(selectedPerson, at: destinationIndexPath.row)
    }
    
    //MARK: - Delete Rows
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
}
