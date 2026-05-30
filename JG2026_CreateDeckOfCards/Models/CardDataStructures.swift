//
//  CardDataStructures.swift
//  JG2026_CreateDeckOfCards
//
//  Created by app-kaihatsusha on 30/05/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation


enum Suits: String, CaseIterable {
    case clubs = "♣️"
    case diamonds = "♦️"
    case hearts = "♥️"
    case spades = "♠️"
}

enum Rank: Int, CaseIterable {
    case ace = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack = 11
    case queen = 12
    case king = 13
    
    var type: String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default: return "\(rawValue)"
        }
    }

}

struct Card: Identifiable {
    
    let id = UUID().uuidString
    let suit: Suits
    let rank: Rank
    
    var type: String { rank.type }
    var value: Int { rank.rawValue }
    var symbol: String { suit.rawValue }
    
    func printCard() {
        print("\(type)\(symbol) has value \(value)")
    }
    
    var cardData: String {
        return "\(type)\(symbol) has value \(value)"
    }
}
