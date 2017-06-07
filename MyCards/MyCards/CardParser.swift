//
//  CardParser.swift
//  MyCards
//
//  Created by Maciej Piotrowski on 09/04/17.
//

import UIKit

final class CardParser: Parser, JSONDataConverting {
    func parse(_ json: Data?, with decoder: JSONDecoder = JSONDecoder()) throws -> Any? {
        guard let json = json else { return nil }
        return try decoder.decode([Card].self, from: json)
    }

    func json(from object: Codable, with encoder: JSONEncoder = JSONEncoder()) throws -> Data? {
        guard let cards = object as? [Card] else { return nil }
        let jsonData = try encoder.encode(cards)
        return jsonData
    }
}
