//
//  API-Methods.swift
//  IMDB
//
//  Created by Youssef on 10/30/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
    
    static let _default = API()
    
    func get_popular(type: String, page: Int = 1, complation : @escaping (_ error : Error?, _ page: Int, _ data: IMDB_DATA?)->Void){
        
        guard let url = URL(string: "http://api.themoviedb.org/3/movie/\(type)?api_key=d5b759f1645a495f85b519e58a812f32") else { return }
        print(url)
        Alamofire.request(url, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: nil).responseJSON {
            (response) in
            switch response.result {
            case .failure(let error) :
                print("failure")
                complation(error, page, nil)
                return
            case .success(_):
                guard let data = response.data else { return }
                print(data)
                do { let data = try JSONDecoder().decode(IMDB_DATA.self, from: data)
                    
                    complation(nil, 0, data)
                }
                catch let error {
                    complation(error, 0, nil)
                    debugPrint(error) }
                return
                
            } } }
}
