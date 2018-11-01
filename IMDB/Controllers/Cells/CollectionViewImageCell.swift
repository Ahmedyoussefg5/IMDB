//
//  CollectionViewImageCell.swift
//  IMDB
//
//  Created by Youssef on 10/30/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit
import  Kingfisher

class CollectionViewImageCell: UICollectionViewCell {
    @IBOutlet var img: UIImageView!
    
    // http://image.tmdb.org/t/p/w185/nBNZadXqJSdt05SHLqgT0HuC5Gm.jpg
    let imgURL = "http://image.tmdb.org/t/p/w185"
    
    
    func configCell(url: String) {
        
        let url = URL(string: "\(imgURL)\(url)")
        img.kf.setImage(with: url)
    }
}
