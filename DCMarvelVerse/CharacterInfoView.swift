//
//  CharacterInfoView.swift
//  DCMarvelVerse
//
//  Created by MJ Orton on 7/28/23.
//

import SwiftUI

struct CharacterInfoView: View {
    let character: Character
    
    var body: some View {
        
        //        Image(URL(string: character.image))
        AsyncImage(url: URL(string: character.image)) { image in
            image.resizable().aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
        Text(character.name)
            .font(.title)
            //.padding()
        //        VStack {
        Text("Publisher: " + character.publisher)
            //.padding()
        Text("Alignment: " + changeAlignmentFilterDescription(character.alignment))
//            .padding()
        HStack {
            VStack {
                Text("Physical Features")
                    .font(.headline)
                Text("Gender: " + character.gender)
                    //.padding()
                Text("Full Name: " + character.fullName)
                    //.padding()
                Text("Race: " + character.race)
                    //.padding()
                Text("Height: " + character.height[0])
                    //.padding()
                Text("Weight: " + character.weight[0])
                    //.padding()
            }
            .padding()
            .padding()
                VStack {
                    Text("Stats")
                        .font(.headline)
                    Text("Intelligence: " + character.intelligence)
                        //.padding()
                    Text("Strength: " + character.strength)
                        //.padding()
                    Text("Speed: " + character.speed)
                        //.padding()
                    Text("Durability: " + character.durability)
                        //.padding()
                    Text("Power: " + character.power)
                        //.padding()
                    Text("Combat: " + character.combat)
                        //.padding()
                    // Display other character details here (e.g., publisher, alignment, etc.)
            }
                .padding()
                .padding()
        }
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
    }
}
