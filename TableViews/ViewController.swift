//
//  ViewController.swift
//  TableViews
//
//  Created by wendy manrique on 28/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let  myCountries = ["España","Mexico","Peru","Colombia","Argentina","Venezuela","EE.UU"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }

 
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
        }
        
        cell!.textLabel?.text = myCountries[indexPath.row]
        return cell!
    }
}

