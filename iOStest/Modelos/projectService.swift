//
//  NetworkService.swift
//  iOStest
//
//  Created by Said Sarabia Saavedra on 3/10/19.
//  Copyright © 2019 Said Sarabia. All rights reserved.
//

import Foundation
class projectService
{
    let projectBaseUrl: URL?
    
    init(url: URL?){
        
        self.projectBaseUrl = url
    }
    
    func getProject(IndiceJSON: Int, completion: @escaping (ProjectInfo?) -> Void)
    {
        if let projectUrl = projectBaseUrl
        {
            let networkProcessor = NetworkProcessor(url: projectUrl)
            networkProcessor.JSONDownloadfromURL({ (jsonDictionary) in
                
                if let projectInfoDirectionary = jsonDictionary
                {
                    let projectInfo = ProjectInfo(projectDictionary: projectInfoDirectionary, index: IndiceJSON)
                    completion(projectInfo)
                }else{
                    completion(nil)
                }
            })
        }
    }
}
