//
//  Network.swift
//  AltimetrikTest
//
//  Created by Abraham Escamilla Pinelo on 05/06/24.
//

import Foundation
import UIKit.UIImage

enum MyError: Error {
    case superError
    case badData
    case badResponse
    case imageFailure

    var description: String {
        switch self {
        case .superError:
            return "A super error has occurred."
        case .badData:
            return "The data received is corrupted or invalid."
        case .badResponse:
            return "The response from the server was not as expected."
        case .imageFailure:
            return "Failed to process the image."
        }
    }
}

class Network {
    
    let mainUrlString = "https://jsonplaceholder.typicode.com/photos"
    
    func fetchImage(with url:URL, completion: @escaping (Result<UIImage,MyError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(.failure(.superError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            
            guard let newImage = UIImage(data: data) else {
                completion(.failure(.imageFailure))
                return
            }
            
            completion(.success(newImage))
            
        }
        session.resume()
    }
    
    func fetch(with url: URL, completion: @escaping (Result<[PhotoModel], MyError>) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(.failure(.superError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let photo = try? decoder.decode([PhotoModel].self, from: data) else {
                completion(.failure(.badData))
                return
            }
            
            completion(.success(photo))
            
        }
        session.resume()
    }
}
