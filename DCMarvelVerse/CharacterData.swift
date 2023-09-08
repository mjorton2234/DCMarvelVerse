//
//  CharacterData.swift
//  DCMarvelVerse
//
//  Created by MJ Orton on 7/28/23.
//

struct CharacterData: Codable {
    let id: String
    let name: String
    let biography: Biography
    let appearance: Appearance
    let powerstats: Powerstats
    let image: CharacterImage
}

struct Biography: Codable {
    enum CodingKeys: String, CodingKey {
        case publisher
        case alignment
        case fullName = "full-name"
    }
    let publisher: String
    let alignment: String
    let fullName: String
}

struct Appearance: Codable {
    enum CodingKeys: String, CodingKey {
        case gender
        case race
        case height
        case weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
    let gender: String
    let race: String
    let height: [String]
    let weight: [String]
    let eyeColor: String
    let hairColor: String
    
    var standardHeight: String? {
            return height.first
        }
    var standardWeight: String? {
            return weight.first
        }
}

struct Powerstats: Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

struct CharacterImage: Codable {
    let url: String
}
