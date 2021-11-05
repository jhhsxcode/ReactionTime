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
        
        //Add code to connect to firebase
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let score = arrayOf.scores[indexPath.row] * Double(arrayOf.levels[indexPath.row])
        let formattedScore = String(format: "%.3f", score)
        cell.textLabel?.text = "\(arrayOf.names[indexPath.row]) - \(formattedScore)"
        
        let formattedTime = String(format: "%.2f", arrayOf.scores[indexPath.row])
        cell.detailTextLabel?.text = "Time:\(formattedTime) at Level:\(arrayOf.levels[indexPath.row])"
        
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
