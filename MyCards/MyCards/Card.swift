//
//  Card.swift
//  MyCards
//
//  Created by Maciej Piotrowski on 16/10/16.
//

import UIKit

extension Data {
    var image: UIImage? {
        return UIImage(data: self)
    }
}

struct Card: Codable {
    let identifier: String
    let name: String
    let front: Data?
    let back: Data?
}

extension Card {
    init(identifier: String = UUID().uuidString,
         name: String) {
        self.identifier = identifier
        self.name = name
        self.front = nil
        self.back = nil
    }
}

extension Card {
    enum Side {
        case front
        case back
    }
}

extension Card.Side: CustomStringConvertible {
    var description: String {
        switch self {
        case .front: return .frontPhoto
        case .back: return .backPhoto
        }
    }
}

extension Card {
    var isValid: Bool {
        guard
            front != nil,
            back != nil,
            !name.isEmpty,
            !identifier.isEmpty
            else { return false }
        return true
    }
}

extension Card {
    init?(json jsonData: Data, decoder: JSONDecoder = JSONDecoder()) throws {
        self = try decoder.decode(Card.self, from: jsonData)
    }
}
