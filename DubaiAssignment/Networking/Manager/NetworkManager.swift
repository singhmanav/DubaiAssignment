//
//  NetworkManager.swift
//  Dubai assignment
//
//  Created by Manav on 12/08/19.
//  Copyright © 2018 Manav. All rights reserved.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}



struct NetworkManager {
    static let environment : NetworkEnvironment = .production
    let router = Router<NYTimesApi>()
    static let sharedNetworkManager = NetworkManager()
    
    func getMostPopularArticles(completion: @escaping (_ article: [Article]?,_ error: String?)->()){
        router.request(.mostPopular) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? Dictionary<String,Any>
                        let articleJson = jsonData?["results"]
                        let articleData = try JSONSerialization.data(withJSONObject: articleJson as Any, options: JSONSerialization.WritingOptions.prettyPrinted)
                        let apiResponse = try JSONDecoder().decode([Article].self, from: articleData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
