//
//  TableViewExpandableCell.swift
//  IMDB
//
//  Created by Youssef on 10/30/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

class TableViewExpandableCell: UITableViewCell {

    @IBOutlet var collectionV: UICollectionView!
    var collectionV_Data = [IMDB_DATA]()
    
    var delegate: ShowDetailsVC!

    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
    
    func configCell(data: IMDB_DATA) {
        collectionV_Data = [data]
        collectionV.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension TableViewExpandableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionV_Data[0].results.count > 0 {
            return collectionV_Data[0].results.count }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.showDetailsVC(data: collectionV_Data[0].results[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionV.dequeueReusableCell(withReuseIdentifier: "collectionViewImageCell", for: indexPath) as! CollectionViewImageCell
        
        cell.configCell(url: collectionV_Data[0].results[indexPath.row].poster_path!)
        
        return cell
    }
}




protocol ShowDetailsVC : NSObjectProtocol {
    func showDetailsVC(data: IMDB_Results) -> Void;
}









