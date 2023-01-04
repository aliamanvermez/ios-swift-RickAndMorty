//
//  RMService.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 30.12.2022.
//

import Foundation
///Primary API Service object to get Rick and Morty Data 
final class RMService {
   
    static let shared = RMService()
    
    enum RMServiceError : Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    private init(){}
    
    public func execute<T : Codable>(_ request: RMRequest, expecting type : T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data , error == nil else {
                completion(.failure(RMServiceError.failedToGetData))
                return
            }
            //Decode Response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }catch {
                completion(.failure(error))
            }
        
        }
        task.resume()
    }
    
   
    
    //MARK: Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest?{
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
