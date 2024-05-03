//
//  PostModel.swift
//  APIPagination
//
//  Created by BA20215448 on 03/05/24.
//

import Foundation
struct PostModel: Decodable, Equatable {
    let userID, id: Int
        let title, body: String

        enum CodingKeys: String, CodingKey {
            case userID = "userId"
            case id, title, body
        }
}
typealias Post = [PostModel]
