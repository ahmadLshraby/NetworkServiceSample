//
//  EndPoint.swift
//  NetworkServiceSample
//
//  Created by sHiKoOo on 4/6/21.
//

import Foundation
import Alamofire

protocol EndPoint {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var parameters: [String: Any] { get }
    var encoding: ParameterEncoding { get }
}
