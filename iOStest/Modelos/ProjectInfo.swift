//
//  CurrentWeather.swift
//  APITest
//
//  Created by Said Sarabia Saavedra on 3/7/19.
//  Copyright © 2019 Said Sarabia. All rights reserved.
//

import Foundation
class ProjectInfo
{
    let name: String?
    let limitdate: String?
    let area: Int?
    let price: Int?
    let license: String?
    let builder: String?
    let description: [String]?
    let services: [String]?
    let progress: Int?
    let address: [String : Any]?
    
    
    struct projectKeys
    {
        static let name = "name"
        static let limitdate = "limitDate"
        static let area = "area"
        static let price = "price"
        static let license = "license"
        static let builder = "builder"
        static let description = "description"
        static let services = "services"
        static let progress = "progress"
        static let address = "address"
    }
    
    init(projectDictionary: [[String: Any]], index:Int)
    {
        name = projectDictionary[index][projectKeys.name] as? String
        limitdate = projectDictionary[index][projectKeys.limitdate] as? String
        area = projectDictionary[index][projectKeys.area] as? Int
        price = projectDictionary[index][projectKeys.price] as? Int
        license = projectDictionary[index][projectKeys.license] as? String
        builder = projectDictionary[index][projectKeys.builder] as? String
        description = projectDictionary[index][projectKeys.description] as? [String]
        services = projectDictionary[index][projectKeys.services] as? [String]
        progress = projectDictionary[index][projectKeys.progress] as? Int
        address = projectDictionary[index][projectKeys.address] as? [String : Any]
    }
}
