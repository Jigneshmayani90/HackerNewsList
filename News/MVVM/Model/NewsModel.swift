//
//  NewsModel.swift
//  News
//
//  Created by Rahul Mayani on 24/04/21.
//

import Foundation
import UIKit

struct NewsModel {
    var id: Int64!
    var title: String!
    var type: String!
    var url: String!
    var time: Int64!
}

extension NewsModel: Codable {
    static func decodeJsonData(_ data: Data) -> NewsModel {
        if let news = decodeJsonData(data) {
            return news
        }
        return NewsModel(id: 0, title: "", type: "", url: "", time: 0)
    }
}

