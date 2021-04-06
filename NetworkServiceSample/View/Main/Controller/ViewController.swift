//
//  ViewController.swift
//  NetworkServiceSample
//
//  Created by sHiKoOo on 4/6/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let reposViewModel = RepoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        getRepos()
    }
    
    func getRepos() {
        shouldPresentLoadingView(true)
        reposViewModel.getAllRepos { (done, errorMsg) in
            self.shouldPresentLoadingView(false)
            if done {
                self.tableView.reloadData()
            }else {
                self.shouldPresentAlertViewWithAction(withTitle: "ERROR",
                                                      message: errorMsg,
                                                      yesActionTitle: "Try Again!",
                                                      noActionTitle: "Cancel",
                                                      yesActionColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                                      noActionColor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),
                                                      delegate: nil,
                                                      parentViewController: self) { [weak self] (done) in
                    if done {
                        self?.getRepos()
                    }
                }
            }
        }
    }
    
    


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reposViewModel.reposData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell",for: indexPath)
        let repo = reposViewModel.reposData?[indexPath.row]
        cell.textLabel?.text = repo?.name
        cell.detailTextLabel?.text = repo?.language
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = reposViewModel.reposData?[indexPath.row]
        if let url = URL(string: repo?.htmlURL ?? "") {
            let safariVC = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
        }
    }
    
    
}

