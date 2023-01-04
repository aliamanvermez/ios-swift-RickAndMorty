//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 30.12.2022.
//

import Foundation

///Object that represents a single API call.

final class RMRequest {
    private struct Constants{
       static let baseURL = "https://rickandmortyapi.com/api"
    }
    private let endpoint : RMEndpoint
    private let pathComponents : [String]
    private let queryParameters : [URLQueryItem]
    
    ///Constructed url for the api request in string format (Apiye yapacagımız requestin URL' ini string formatına çevirdik)
    private var urlString: String{
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
                
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    public var url : URL?{
        return URL(string: urlString)
    }
    public let httpMethod = "GET"
  
    public init(endpoint: RMEndpoint,
         pathComponents: [String] = [],
         queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
extension RMRequest{
    static let listCharactersRequest = RMRequest(endpoint: .character)
}
