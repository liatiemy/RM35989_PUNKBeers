//
//  BeerViewController.swift
//  RM36989
//
//  Created by Lia Tiemy on 11/19/17.
//  Copyright © 2017 Lia Tiemy. All rights reserved.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {
    
    
    @IBOutlet weak var tfName: UILabel!
    @IBOutlet weak var tfTagline: UILabel!
    @IBOutlet weak var tfDescription: UILabel!
    @IBOutlet weak var tfTeorAlcoolico: UILabel!
    @IBOutlet weak var tfEscalaAmargor: UILabel!
    @IBOutlet weak var ivBeer: UIImageView!
    
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if beer != nil {
            tfName.text = beer.name
            tfTagline.text = beer.tagline
            tfDescription.text = beer.description
            tfTeorAlcoolico.text = "\(beer.abv)"
            if beer.ibu == 0.0{
                tfEscalaAmargor.text = "N/A"
            }else{
                tfEscalaAmargor.text = "\(beer.ibu)"
            }
            ivBeer.kf.setImage(with: ImageResource(downloadURL: URL(string: beer.image_url)!, cacheKey: beer.name))
            
        }
        
        //        REST.downloadImage(url: beer.image_url) { (image: UIImage?) in
        //            DispatchQueue.main.async {
        //                self.ivBeer.image = image
        //            }
        //        }
    }
}

