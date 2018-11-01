//
//  ViewController.swift
//  IMDB
//
//  Created by Youssef on 10/31/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {

    @IBOutlet var backIMG: UIImageView!
    @IBOutlet var posterIMG: UIImageView!
    @IBOutlet var moviName: UILabel!
    @IBOutlet var mociYear: UILabel!
    @IBOutlet var moviRate: UILabel!
    
    @IBOutlet var detailsTV: UITextView!
    let imgURL = "http://image.tmdb.org/t/p/w185"

    static var dataaa = [IMDB_Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configVC()
    }

    func configVC(){//(data: IMDB_Results) {
        let link = DetailsVC.dataaa[0].poster_path
        let urlIMG = URL(string: "\(imgURL)\(link)")
            posterIMG.kf.setImage(with: urlIMG)
        
        if let link = DetailsVC.dataaa[0].backdrop_path {
           let urlIMG = URL(string: "\(imgURL)\(link)")
            backIMG.kf.setImage(with: urlIMG) }
        
        moviName.text = DetailsVC.dataaa[0].title
        mociYear.text = DetailsVC.dataaa[0].release_date
        if let moviRaty = DetailsVC.dataaa[0].vote_average {
            moviRate.text = "\(moviRaty)" }
        detailsTV.text = DetailsVC.dataaa[0].overview
    }


}
