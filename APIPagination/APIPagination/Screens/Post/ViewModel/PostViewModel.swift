//
//  PostViewModel.swift
//  APIPagination
//
//  Created by BA20215448 on 03/05/24.
//

import Foundation

protocol PostServices: AnyObject {
    func reloadData() // Data Binding - PROTOCOL (View and ViewModel Communication)
}
class PostViewModel {
    var currentPage = 1
    var isFetchingNextPage = true

    var posts: [PostModel] = [] {
        didSet {
            self.postDelegate?.reloadData()
        }
    }
    private let manager = APIManager()
    weak var postDelegate: PostServices?

    @MainActor func fetchPosts() {
        
        Task {
            do {
                let userResponseArray: [PostModel] = try await manager.request(url: getURL(currentPage: currentPage))
                if userResponseArray.count > 0 {
                    
                    currentPage = currentPage + 1
                    isFetchingNextPage = true
                    self.posts.append(contentsOf: userResponseArray)
                } else {
                    isFetchingNextPage = false
                    self.posts = self.posts
                }
                
                
            }catch {
                debugPrint("catch Error:: ", error)
            }
        }

    }

}
