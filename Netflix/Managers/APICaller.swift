//
//  APICaller.swift
//  Netflix
//
//  Created by Sultan on 27/10/23.
//

import UIKit


struct Constants {
    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
    static let baseURl = "https://api.themoviedb.org"
    
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURl)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results.results[0].original_title)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
