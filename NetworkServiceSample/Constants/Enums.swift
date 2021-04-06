//
//  Enums.swift
//  NetworkServiceSample
//
//  Created by sHiKoOo on 4/6/21.
//

import Foundation


struct Storyboards {
    static let splash = "Splash"
    static let login = "Login"
    static let main = "Main"
}

enum AppLanguages: String {
    case english = "en"
    case arabic = "ar"
}

enum NetworkServicesError {
    case serverError(serverError: String)
    case connectionError(connection: String)
    case responseError(response: String)
}
