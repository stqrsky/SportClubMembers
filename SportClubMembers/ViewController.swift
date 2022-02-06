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
        
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(!isEditing, animated: true)
        tableView.setEditing(!tableView.isEditing, animated: true)
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
