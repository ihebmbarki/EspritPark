//
//  MapResultsViewController.swift
//  CustomLogin
//
//  Created by iheb mbarki on 9/9/2022.
//

import UIKit

class MapResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableview: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var places: [Place] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.frame = view.bounds
    }
    
    public func update(with places: [Place]) {
        self.places = places
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        
    }

}

