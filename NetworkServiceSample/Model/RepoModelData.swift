//
//  RepoModelData.swift
//  NetworkServiceSample
//
//  Created by sHiKoOo on 4/6/21.
//

import Foundation


struct ReposData: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [RepoModelData]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct RepoModelData: Codable {
    let name: String?
    let htmlURL: String?
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case htmlURL = "html_url"
        case language
    }
}
