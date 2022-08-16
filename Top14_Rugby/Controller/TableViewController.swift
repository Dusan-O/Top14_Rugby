//
//  TableViewController.swift
//  Top14_Rugby
//
//  Created by Dusan Orescanin on 16/08/2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let id = "ToDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datas.shared.allClubs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let club = Datas.shared.allClubs[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Club") as? ClubCell {
            cell.setupCell(club)
            return cell
        }
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let club = Datas.shared.allClubs[indexPath.row]
        performSegue(withIdentifier: id, sender: club)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == id {
            if let detail = segue.destination as? DetailViewController {
                detail.club = sender as? Club
            }
        }
    }
    

}
