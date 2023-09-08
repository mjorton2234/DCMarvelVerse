//
//  ContentView.swift
//  DCMarvelVerse
//
//  Created by MJ Orton on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var filteredPublishers: Set<String> = ["Marvel Comics","Marvel Comics", "Giant-Man", "Rune King Thor", "DC Comics", "Superman Prime One-Million", "Oracle", "Batman II"]
    @State var filteredAlignments: Set<String> = ["good", "bad", "neutral"]
    @StateObject private var viewModel = CharacterViewModel()
    @StateObject private var charactersCopy = CharacterViewModel()
    @State private var searchText = ""
    @State private var showFilterOptions = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("DC ")
                    .foregroundColor(.blue)
                    .font(.title)
                + Text("Marvel ")
                    .foregroundColor(.red)
                    .font(.title)
                + Text("Verse")
                    .foregroundColor(.black)
                    .font(.title)

//                Text("DC Marvel Verse")
//                    .font(.title)
//                    .padding()
                
                SearchBar(text: $searchText)
                    .padding()
                
                HStack {
                    Spacer()
                    Button("Filter") {
                        showFilterOptions.toggle()
                    }
                    .padding(.horizontal)
                }
                
                List(viewModel.filteredCharacters(searchText: searchText.isEmpty ? "" : searchText)) { character in
                    if filteredPublishers.contains(character.publisher) &&
                        (character.name.localizedCaseInsensitiveContains(searchText) ||
                         character.fullName.localizedCaseInsensitiveContains(searchText) ||
                         searchText.isEmpty) {
                            
                        NavigationLink(destination: CharacterInfoView(character: character)) {
                            Text(character.name)
                        }
                    }
                }
                
//                List(viewModel.filteredCharacters(searchText: searchText)) { character in
//                    if filteredPublishers.contains(character.publisher) {
//                        NavigationLink(destination: CharacterInfoView(character: character)) {
//                            Text(character.name)
//                        }
//                    }
//                } //Latest Version of the List
                
//                List(viewModel.filteredCharacters(searchText: searchText)) { character in
//                    NavigationLink(destination: CharacterInfoView(character: character)) {
//                        Text(character.name)
//                    }
//                }
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button(action: {
                    // Handle back button action here
                }) {
                    HStack {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue) // Customize the color
                        Text("Back")
                            .foregroundColor(.blue) // Customize the color
                    }
                }
                )
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showFilterOptions) {
            FilterOptionsView(viewModel: viewModel, originalCharacterData: charactersCopy, filteredPublishers: $filteredPublishers, filteredAlignments: $filteredAlignments)
        }
        .onAppear {
//            viewModel.fetchCharacters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

