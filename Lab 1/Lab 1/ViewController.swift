//
//  ViewController.swift
//  Lab 1
//
//  Created by Paul Angelo Sy on 2/22/23.
//

import UIKit

struct Restaurant {
    var imageName: String
    var name: String
}


class tableViewController: UITableViewController {
    
    
    
    var restaurants = [
        Restaurant(imageName: "jollibeeImage", name: "Jolibee"),
        Restaurant(imageName: "mcdoPic", name: "McDonald's"),
        Restaurant(imageName: "Wendys", name: "Wendy's"),
        Restaurant(imageName: "tacoBelll", name: "Taco Bell"),
        Restaurant(imageName: "kFc", name: "KFC"),
        Restaurant(imageName: "burgerKing", name: "Burger King"),
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "tableViewCell", bundle: nil), forCellReuseIdentifier: "cellTemplate")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTemplate", for: indexPath) as? tableViewCell
        else {return UITableViewCell()}
        let restaurant = restaurants[indexPath.row]
        cell.cellImage.image = UIImage(named: restaurant.imageName)
        cell.cellLabel.text = restaurant.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
//        let storyboard = UIStoryboard(name:"Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "secondView") as? secondView
//        self.navigationController?.pushViewController(viewController!, animated: true)
        self.performSegue(withIdentifier: "toSecondView", sender: cell)
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
}
