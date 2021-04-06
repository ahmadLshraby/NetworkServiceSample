//
//  RepoViewModel.swift
//  NetworkServiceSample
//
//  Created by sHiKoOo on 4/6/21.
//

import Foundation


class RepoViewModel {
    
    public private (set) var reposData: [RepoModelData]?
    
}


extension RepoViewModel {
    func getAllRepos(handler: @escaping(Bool, String) -> Void) {
        NetworkServices.request(endPoint: APP_EndPoints.listAllRepos, responseClass: ReposData.self) { (reData, error) in
            if let repos = reData {
                self.reposData = repos.items
                handler(true, "")
            }else {
                switch error {
                case .connectionError(let msg):
                    handler(false, msg)
                case .serverError(let msg):
                    handler(false, msg)
                case .responseError(let msg):
                    handler(false, msg)
                default:
                    handler(false, "UNKOWN")
                }
            }
        }
    }
}
