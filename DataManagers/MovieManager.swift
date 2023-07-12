//
//  MovieManager.swift
//  MovieApp
//
//  Created by Modoranu Cosmin on 05.08.2022.
//

import Foundation


struct PopularMoviesResponse: Codable{
    let results:[Movie]
}

struct Movie:Codable {
    enum Section: String, CaseIterable {
            case POPULAR = "Popular Movies"
            case UPCOMING = "Upcoming"
            case TOPRATED = "Top Rated"
        }
    
    
    let id:Int
    let original_language:String?
    let original_title:String?
    let poster_path:String?
    let overview:String?
    let vote_count: Int
    let release_data:String?
    let vote_average:Double
    
  
}
//
//{
//adult = 0;
//"backdrop_path" = "/jRss224yETAKKzqrOyudQo5ayUd.jpg";
//"genre_ids" =             (
//10751,
//16,
//12,
//35,
//14
//);
//id = 438148;
//"original_language" = en;
//"original_title" = "Minions: The Rise of Gru";
//overview = "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.";
//popularity = "6040.576";
//"poster_path" = "/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg";
//"release_date" = "2022-06-29";
//title = "Minions: The Rise of Gru";
//video = 0;
//"vote_average" = "7.8";
//"vote_count" = 875;
//},
