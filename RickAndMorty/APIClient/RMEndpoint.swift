//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Namerei on 05.01.23.
//

import Foundation

/// represent unique API endpoint
@frozen enum RMEndpoint: String {
    //// Endpoint to get character info
    case character
    //// Endpoint to get location info
    case location
    //// Endpoint to get episode info
    case episode
}
