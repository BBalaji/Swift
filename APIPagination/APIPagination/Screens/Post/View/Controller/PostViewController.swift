//
//  PostViewController.swift
//  APIPagination
//
//  Created by BA20215448 on 03/05/24.
//

import UIKit
class PostViewController: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    private let viewModel = PostViewModel()
    private let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Posts View"
        initViewModel()
    }
    func initViewModel() {
        postTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshPostData(_:)), for: .valueChanged)
        viewModel.postDelegate = self
        refreshPostData(self)
    }
    @objc private func refreshPostData(_ sender: Any) {
        // Post Data
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Post Data ...", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 255.0/255.0, green: 182.0/255.0, blue: 8.0/255.0, alpha: 1.0)])
        
        viewModel.posts.removeAll()
        viewModel.currentPage = 1
        viewModel.isFetchingNextPage = true
        FetchPosts()
        refreshControl.endRefreshing()
    }
    private func FetchPosts() {
        if self.viewModel.isFetchingNextPage {
            self.viewModel.fetchPosts()
        }
    }
}

extension PostViewController: PostServices {
    func reloadData() {
        self.postTableView.reloadData()
        }
}
extension PostViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Array(Set(viewModel.posts.map({ $0.userID}))).sorted().count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "UserID: - \(Array(Set(viewModel.posts.map({ $0.userID}))).sorted()[section])"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.filter( { $0.userID == section + 1 }).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        else { return UITableViewCell() }
        var content = cell.defaultContentConfiguration()
        content.text = "\(viewModel.posts.filter( { $0.userID == indexPath.section + 1 })[indexPath.row].id)"
        content.secondaryText = "\(viewModel.posts.filter( { $0.userID == indexPath.section + 1 })[indexPath.row].title)"
        cell.contentConfiguration = content
        return cell
    }
    
}
extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        debugPrint("Post Current Page: \(viewModel.currentPage)")
        debugPrint("Post Count: \(viewModel.posts.count)")
        tableView.addLoading(indexPath) {
            self.FetchPosts()
            tableView.stopLoading()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "PostDetail") as? PostDetailViewController {
            vc.title = " UserID :-  \(viewModel.posts.filter( { $0.userID == indexPath.section + 1 })[indexPath.row].userID)"
            vc.post = viewModel.posts.filter( { $0.userID == indexPath.section + 1 })[indexPath.row]
            show(vc, sender: self)
        }
    }
}
