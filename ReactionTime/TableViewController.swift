//
//  TableViewController.swift
//  ReactionTime
//
//  Created by Robert D. Brown
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayOf = ArrayOf()
    var name: String!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { (timer) in
            self.getScores()
        })
        
        getScores()
    }
    
    public func getScores()
    {
        arrayOf.scores.removeAll()
        arrayOf.names.removeAll()
        arrayOf.levels.removeAll()
        
        //Code Here to Connect to Firebase and get scores
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(arrayOf.names[indexPath.row])"
        let formattedTime = String(format: "%.3f", arrayOf.scores[indexPath.row])
        cell.detailTextLabel?.text = "Time:\(formattedTime)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOf.scores.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gamePlaySegue" {
            let nvc = segue.destination as! ViewController
            nvc.passedArrayOf = arrayOf
            nvc.name = name
        }
    }
    
}
