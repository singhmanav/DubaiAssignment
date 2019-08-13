//
//  EndPoint.swift
//  Dubai assignment
//
//  Created by Manav on 12/08/19.
//  Copyright © 2018 Manav. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum NYTimesApi {
    case mostPopular
}

struct Constants {
    
    static let apiKey: String = "1a5WAUgPBjTbNSEebbndXXUCuyB6n1iK"
    static var period: String = "7"
}

extension NYTimesApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.nytimes.com"
        case .qa: return ""
        case .staging: return ""
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
      
        case .mostPopular:
            return "svc/mostpopular/v2/viewed/\(Constants.period).json"
      
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .mostPopular:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api-key":Constants.apiKey])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


