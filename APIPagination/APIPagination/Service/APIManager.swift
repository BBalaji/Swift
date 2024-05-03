//
//  APIManager.swift
//  APIPagination
//
//  Created by BA20215448 on 03/05/24.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

class APIManager {
    func request<T: Decodable>(url: String) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }
        debugPrint("URL::",url)
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
