//
//  TableViewController.swift
//  IMDB
//
//  Created by Youssef on 10/30/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ShowDetailsVC {
    func showDetailsVC(data: IMDB_Results) {
        //let vc = storyboard?.instantiateViewController(withIdentifier: "detailsVC") as! DetailsVC
        DetailsVC.dataaa = [data]
        performSegue(withIdentifier: "todetailsVC", sender: nil)
        //self.present(vc, animated: true, completion: nil)
    }
    

    @IBOutlet var collectionV: UICollectionView!
    
    //var generalData = [Popular_IMDB]()
    
    let sections = ["popular" , "upcoming" , "now_playing" , "top_rated" , "latest"]
    var _dict = Dictionary<Int, IMDB_DATA>()
    var dict = Dictionary<Int, IMDB_DATA>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // DetailsVC.deleg
        
        popular()
    }
    
    func popular() {

        API._default.get_popular(type: sections[0], page: 1) { (error, page, data) in
            if error.self == nil {
                self.dict[0] = data
                self._dict = self.dict
                DispatchQueue.main.async {
                    let sectionToReload = 0
                    let indexSet: IndexSet = [sectionToReload]
                    self.tableView.reloadSections(indexSet, with: .fade)
                    self.upcoming()
                } } }
    }

    func upcoming() {
        
        API._default.get_popular(type: sections[1], page: 1) { (error, page, data) in
            if error.self == nil {
                self.dict[1] = data
                self._dict = self.dict
                DispatchQueue.main.async {
                    let sectionToReload = 1
                    let indexSet: IndexSet = [sectionToReload]
                    self.tableView.reloadSections(indexSet, with: .fade)
                    self.now_playing()
                } } }
    }
    
    func now_playing() {
        API._default.get_popular(type: sections[2], page: 1) { (error, page, data) in
            if error.self == nil {
                self.dict[2] = data
                self._dict = self.dict
                DispatchQueue.main.async {
                    let sectionToReload = 2
                    let indexSet: IndexSet = [sectionToReload]
                    self.tableView.reloadSections(indexSet, with: .fade)
                    self.top_rated()
                } } }
    }
    
    func top_rated() {
        API._default.get_popular(type: sections[3], page: 1) { (error, page, data) in
            if error.self == nil {
                self.dict[3] = data
                self._dict = self.dict
                DispatchQueue.main.async {
                    let sectionToReload = 3
                    let indexSet: IndexSet = [sectionToReload]
                    self.tableView.reloadSections(indexSet, with: .fade)
                    self.latest()
                } } }
    }
    
    func latest() {
        API._default.get_popular(type: sections[4], page: 1) { (error, page, data) in
            if error.self == nil {
                self.dict[4] = data
                self._dict = self.dict
                DispatchQueue.main.async {
                    let sectionToReload = 4
                    let indexSet: IndexSet = [sectionToReload]
                    self.tableView.reloadSections(indexSet, with: .fade)
                    print("latest")
                } } }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dict[section] != nil {
            return 1
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bTN = UIButton(type: .system)
        let title = sections[section]
        bTN.setTitle(title, for: .normal)
        
        bTN.addTarget(self, action: #selector(expandCell), for: .touchUpInside)
        bTN.tag = section
        return bTN
    }
    
    @objc func expandCell(button: UIButton) {
        print("I was clicked")
        let sec = button.tag
        if dict[sec] != nil {
        let indexPath = IndexPath(item: 0, section: sec)
        dict[sec] = nil
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else {
            dict[sec] = _dict[sec]
            let sectionToReload = sec
            let indexSet: IndexSet = [sectionToReload]
            self.tableView.reloadSections(indexSet, with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if dict[indexPath.row] != nil {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewExpandableCell", for: indexPath) as! TableViewExpandableCell
            cell.delegate = self

            print(indexPath.section)
           // print(dict[indexPath.row])
            cell.configCell(data: dict[indexPath.section]!)
            

            return cell }

       return UITableViewCell()
    }
    
    func loadNewScreen(controller: UIViewController) {
        self.present(controller, animated: true) { () -> Void in
        };
    }
}













