//
//  dataModel.swift
//  IMDB
//
//  Created by Youssef on 10/30/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import Foundation

struct IMDB_DATA: Decodable {
    var page : Int?
    var total_pages:  Int?
    var results : [IMDB_Results]
}

struct IMDB_Results: Decodable {
    var vote_count: Int?
    var id: Int?
    var video: Bool?
    var vote_average: Float?
    var title: String?
    var popularity: Float?
    var poster_path: String?
    var overview: String?
    var release_date: String?
    var backdrop_path: String?
}
/*
 
 {
 page: 1,
 total_results: 19819,
 total_pages: 991,
 results: [
 {
 vote_count: 1734,
 id: 335983,
 video: false,
 vote_average: 6.6,
 title: "Venom",
 popularity: 376.076,
 poster_path: "/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg",
 original_language: "en",
 original_title: "Venom",
 genre_ids: [
 878
 ],
 backdrop_path: "/VuukZLgaCrho2Ar8Scl9HtV3yD.jpg",
 adult: false,
 overview: "When Eddie Brock acquires the powers of a symbiote, he will have to release his alter-ego "Venom" to save his life.",
 release_date: "2018-10-03"
 },
 {
 vote_count: 397,
 id: 424139,
 video: false,
 vote_average: 6.7,
 title: "Halloween",
 popularity: 297.488,
 poster_path: "/bXs0zkv2iGVViZEy78teg2ycDBm.jpg",
 original_language: "en",
 original_title: "Halloween",
 genre_ids: [
 27,
 53
 ],
 backdrop_path: "/tZ358Wk4BnOc4FjdGsiexAUvCMH.jpg",
 adult: false,
 overview: "Laurie Strode comes to her final confrontation with Michael Myers, the masked figure who has haunted her since she narrowly escaped his killing spree on Halloween night four decades ago.",
 release_date: "2018-10-18"
 }
 }
 */
