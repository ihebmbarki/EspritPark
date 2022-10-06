//
//  HomeViewController.swift
//  CustomLogin
//
//  Created by iheb mbarki on 25/8/2022.
//

import UIKit
import MapKit

class HomeViewController: UITabBarController, UISearchResultsUpdating {

    let mapView = MKMapView()
    let searchVC = UISearchController(searchResultsController: MapResultsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        title = "Maps"
        view.addSubview(mapView)
        
        searchVC.searchBar.backgroundColor = .secondarySystemBackground
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = CGRect(x: 0, y: view.safeAreaInsets.top,
                               width: view.frame.size.width,
                               height: view.frame.size.height - view.safeAreaInsets.top)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              let resultsVC = searchController.searchResultsController as? MapResultsViewController
        else {
                  return
              }
        
        GooglePlacesManager.shared.findPlaces(query: query) { result in
            switch result {
            case .success(let places):
                
                DispatchQueue.main.async {
                    resultsVC.update(with: places)
                }
                print(places)
            case .failure(let error):
                print(error)
            }
        }
         
    }
    

}
