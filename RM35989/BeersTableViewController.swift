//
//  BeersTableViewController.swift
//  RM35989
//
//  Created by Lia Tiemy on 11/19/17.
//  Copyright © 2017 Lia Tiemy. All rights reserved.
//

import UIKit
import Kingfisher

class BeersTableViewController: UITableViewController {
    
    var beers: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "view" {
            let vc = segue.destination as! BeerViewController
            vc.beer = beers[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    func loadBeers() {
        
        
        REST.loadCars { (beers: [Beer]?) in
            if let beers = beers {
                self.beers = beers
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBeers()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
        
        let beer = beers[indexPath.row]
        
        cell.lbName.text = beer.name
        cell.lbAbv?.text = "Teor alcoólico \(beer.abv)"
        
        let image = ImageResource(downloadURL: URL(string: beer.image_url)!, cacheKey: beer.name)
        cell.ivImage.kf.setImage(with: image)
        
        
        //        REST.downloadImage(url: beer.image_url) { (image: UIImage?) in
        //            DispatchQueue.main.async {
        //                cell.ivImage.image = image
        //            }
        //        }
        return cell
    }
    
}

