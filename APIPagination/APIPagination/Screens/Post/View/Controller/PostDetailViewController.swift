//
//  PostDetailViewController.swift
//  APIPagination
//
//  Created by BA20215448 on 03/05/24.
//

import UIKit
class PostDetailViewController: UIViewController {
    @IBOutlet weak var postShowTableView: UITableView!
    var post: PostModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Deatail Post View"
    }
}

extension PostDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //Array(Set(viewModel.users.map({ $0.userID}))).sorted().count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "UserID: - \(post.userID)"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        else { return UITableViewCell() }
        var content = cell.defaultContentConfiguration()
        content.text = "\(post.id) : \(post.title.uppercased())"
        content.secondaryText = "\(post.body)"
        cell.contentConfiguration = content
        return cell
    }
}
