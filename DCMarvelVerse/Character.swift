//
//  Character.swift
//  DCMarvelVerse
//
//  Created by MJ Orton on 7/28/23.
//

struct Character: Identifiable, Decodable {
    let id: String
    let name: String
    let publisher: String
    let alignment: String
    let fullName: String
    let gender: String
    let race: String
    let height: [String]
    let weight: [String]
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
    let image: String
}

extension Character {
    init(data: CharacterData) {
        self.id = data.id
        self.name = data.name
        self.publisher = data.biography.publisher
        self.alignment = data.biography.alignment
        self.fullName = data.biography.fullName
        self.gender = data.appearance.gender
        self.race = data.appearance.race
        self.height = data.appearance.height
        self.weight = data.appearance.weight
        self.intelligence = data.powerstats.intelligence
        self.strength = data.powerstats.strength
        self.speed = data.powerstats.speed
        self.durability = data.powerstats.durability
        self.power = data.powerstats.power
        self.combat = data.powerstats.combat
        self.image = data.image.url
    }
}
