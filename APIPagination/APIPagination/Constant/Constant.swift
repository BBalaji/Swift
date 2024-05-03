//
//  Constant.swift
//  APIPagination
//
//  Created by BA20215448 on 03/05/24.
//

import Foundation
func getURL(currentPage: Int) -> String {
    "https://jsonplaceholder.typicode.com/posts?_page=\(currentPage)&_limit=10"
}
