//
//  TopNewsListModel.swift
//  News
//
//  Created by Rahul Mayani on 24/04/21.
//

import Foundation
import UIKit

struct TopNewsListModel: Codable {
    
    typealias type = [Int64]
    
    static func decodeJsonData(_ data: Data) -> type {
        if let topNews = type.decodeJsonData(data) {
            return topNews
        }
        return []
    }
}
