//
//  APP_EndPoints.swift
//  NetworkServiceSample
//
//  Created by sHiKoOo on 4/6/21.
//

import Foundation
import Alamofire

enum APP_EndPoints: EndPoint {
    // AUTH
    case login(phone: String, password: String, deviceID: String, fbToken: String)
    // REPOS
    case listAllRepos
    
    var path: String {
        switch self {
        case .login:
            return ""
        case .listAllRepos:
            return "https://api.github.com/search/repositories?Swift&sort=stars&order=desc"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .listAllRepos:
            return .get
        case .login:
            return .post
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .listAllRepos:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        let token = "saved user token"
        switch self {
        case .login:
            return [:]
        default:
            return [
                "Authorization": token]
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .login(let phone, let password,  let deviceID, let fbToken):
            return [
                "msisdn" : phone,
                "password" : password,
                "device_id" : deviceID,
                "firebase_id" : fbToken]
        case .listAllRepos:
            return [
                "q" : "Swift"]
        }
    }
    
}
