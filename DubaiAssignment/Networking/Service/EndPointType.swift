//
//  EndPoint.swift
//  Dubai assignment
//
//  Created by Manav on 12/08/19.
//  Copyright © 2018 Manav. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

