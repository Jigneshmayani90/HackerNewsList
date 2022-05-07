//
//  Structs.swift
//  News
//
//  Created by Rahul Mayani on 24/04/21.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

public struct APIEndPoint {
    
    static let endPointURL = Environment.production.rawValue
    
    private enum Environment:String {
        case develop = "local host"
        case staging = "stage"
        case production = "https://hacker-news.firebaseio.com/"
    }
    
    private static let version = "v0/"
    
    struct Name {
        static let topNews = endPointURL + version + "topstories.json"
        static let newsDetails = endPointURL + version + "item/" //item/{storie_id}}.json
    }
}


public struct AppDateFormat {
    static let date = "dd/MM/yyyy"
}
