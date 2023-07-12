//
//  APICaller.swift
//  MovieApp
//
//  Created by Modoranu Cosmin on 05.08.2022.
//

import Foundation

struct Constants{
    static let API_KEY = "5a478be294eac33de58a26c82fe666ec"
    static let baseURL = "https://api.themoviedb.org"
}
enum APIError: Error {
case failedTogetID
}
class APICaller {
    static let shared = APICaller()
    
    
    func getPopularMovies(complition: @escaping (Result<[Movie],Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(PopularMoviesResponse.self, from: data)
                complition(.success(results.results))
            }catch{
                complition(.failure(APIError.failedTogetID))
            }
        }
        task.resume()
    }
    func getUpcomingMovies(complition: @escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(PopularMoviesResponse.self, from: data)
                complition(.success(results.results))
            }catch{
                complition(.failure(APIError.failedTogetID))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(complition: @escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data ,error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(PopularMoviesResponse.self, from: data)
                complition(.success(results.results))
            }catch{
                complition(.failure(APIError.failedTogetID))
            }
        }
        task.resume()
    }
    func getDiscoverMovies(complition: @escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data ,error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(PopularMoviesResponse.self, from: data)
                complition(.success(results.results))
            }catch{
                complition(.failure(APIError.failedTogetID))
            }
        }
        task.resume()
 }
    func searchMovie(with query:String,complition: @escaping (Result<[Movie],Error>) -> Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data ,error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(PopularMoviesResponse.self, from: data)
                complition(.success(results.results))
            }catch{
                complition(.failure(APIError.failedTogetID))
            }
        }
        task.resume()
 }
}
//https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher

