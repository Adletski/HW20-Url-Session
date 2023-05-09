//
//  Card.swift
//  START-HW20
//
//  Created by Adlet Zhantassov on 07.05.2023.
//

import Foundation

//MARK: - Card
struct Card: Codable {
    let cards: [CardElement]
}

// MARK: - CardElement
struct CardElement: Codable {
    let name: String
    let manaCost: String
    let cmc: Int
    let type: String
    let types: [String]
    let rarity: String
    let set: String
    let setName: String
    let text: String
    let artist: String
    let number: String
    let layout: String
    let multiverseid: String?
    let imageUrl: String?
    let printings: [String]
    let originalText, originalType: String?
    let legalities: [LegalityElement]?
    let id: String
    let variations: [String]?
    let flavor: String?
}

// MARK: - LegalityElement
struct LegalityElement: Codable {
    let format: String
    let legality: String
}
