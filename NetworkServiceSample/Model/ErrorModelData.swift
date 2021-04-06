//
//  ErrorModelData.swift
//  NetworkServiceSample
//
//  Created by sHiKoOo on 4/6/21.
//

import Foundation

struct ErrorModelData: Codable {
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
