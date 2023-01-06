//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Namerei on 05.01.23.
//

import Foundation


/// Single API Call
final class RMRequest {
    
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// Path component for API, if any
    private let pathComponent: [String]
    
    /// Query argument for API ,if any
    private let queryParametrs: [URLQueryItem]
    
    /// Constucted url for api request for string format
    private var urlString: String {
        var string = Constants.baseUrl + "/" + endpoint.rawValue
        
        if !pathComponent.isEmpty {
            pathComponent.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParametrs.isEmpty {
            string += "?"
            let argumentString = queryParametrs.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    //MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponent: Collection of Path component
    ///   - queryParametrs: Collection of query parameters
    public init(endpoint: RMEndpoint,
         pathComponent: [String] = [],
         queryParametrs: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponent = pathComponent
        self.queryParametrs = queryParametrs
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
