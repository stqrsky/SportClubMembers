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
    
}
