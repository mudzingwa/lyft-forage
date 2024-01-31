//
//  RideHistoryViewController.swift
//  RideSharer
//
//

import UIKit

class RideHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //    let tableViewData = Array(repeating: "Item", count: 5)
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let rideHistory = [("Driver: Joe, 12/29/2021", "$26.50"),
                       ("Driver: Sandra, 01/03/2022", "$13.10"),
                       ("Driver: Hank, 01/11/2022", "$16.20"),
                       ("Driver: Michelle, 01/19/2022", "$8.50")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "TableViewCell")
        
        tableView.dataSource = self
        
        //the button delegate
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rideHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                 for: indexPath)
        let rideInfo = self.rideHistory[indexPath.row]
        let driverName = rideInfo.0
        let rideCost = rideInfo.1
        
        cell.textLabel?.text = "\(driverName), Cost: \(rideCost)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRide = rideHistory[indexPath.row]
    // create the alert
    let alert = UIAlertController(title: "didTapRider", message: "You have tapped a Ride History..", preferredStyle: UIAlertController.Style.alert)
    
    // add an action (button)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    
    // show the alert
    self.present(alert, animated: true, completion: nil)
}
    
}
