//
//  Codable+Extension.swift
//  News
//
//  Created by Rahul Mayani on 24/04/21.
//

import Foundation

extension Encodable {
    var parameters: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

extension Decodable {
    static func decodeJsonData(_ data: Data) -> Self? {
        do {
            return try JSONDecoder().decode(Self.self, from: data)
        } catch let error {
            debugPrint(error.localizedDescription)
            //UIAlertController.showAlert(title: nil, message: error.localizedDescription)
            return nil
        }
    }
}
