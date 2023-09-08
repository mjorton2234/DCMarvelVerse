//
//  FilterOptionsView.swift
//  DCMarvelVerse
//
//  Created by MJ Orton on 7/28/23.
//
//import SwiftUI
//
//struct FilterOptionsView: View {
//    @Environment(\.dismiss) private var dismiss
//
//    @ObservedObject var viewModel: CharacterViewModel
//
//    @State private var selectedPublishers: Set<String> = []
//    @State private var selectedAlignments: Set<String> = []
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Filter by Publisher")
//                .font(.headline)
//                .padding()
//
//            ForEach(["All", "Marvel Comics", "DC Comics"], id: \.self) { publisher in
//                Button(publisher) {
//                    if publisher == "All" {
//                        selectedPublishers.removeAll()
//                    } else {
//                        if selectedPublishers.contains(publisher) {
//                            selectedPublishers.remove(publisher)
//                        } else {
//                            selectedPublishers.insert(publisher)
//                        }
//                    }
//                }
//                .padding()
//                .background(selectedPublishers.contains(publisher) ? Color.blue : Color.clear)
//            }
//
//            Text("Filter by Alignment")
//                .font(.headline)
//                .padding()
//
//            ForEach(["good", "bad", "neutral"], id: \.self) { alignment in
//                Button(alignment) {
//                    if selectedAlignments.contains(alignment) {
//                        selectedAlignments.remove(alignment)
//                    } else {
//                        selectedAlignments.insert(alignment)
//                    }
//                }
//                .padding()
//                .background(selectedAlignments.contains(alignment) ? Color.blue : Color.clear)
//            }
//
//            Spacer()
//        }
//    }
//}


//import SwiftUI
//
//struct FilterOptionsView: View {
//    @Environment(\.dismiss) private var dismiss
//
//    @ObservedObject var viewModel: CharacterViewModel
//    @ObservedObject var originalCharacterData: CharacterViewModel
//
//    var body: some View {
//        VStack(alignment: .leading) {
//
//            Button("Clear") {
//                viewModel.characters = originalCharacterData.characters
//
//                dismiss()
//            }
//            .padding()
//
//            Text("Filter by Publisher")
//                .font(.headline)
//                .padding()
//
//            ForEach(["Marvel Comics", "DC Comics"], id: \.self) { publisher in
//                Button(publisher) {
//                    // Implement filter logic based on publisher selection
//                    // You can modify the CharacterViewModel to handle filtering
//                    // This is just a placeholder
//                    viewModel.characters = viewModel.characters.filter { $0.publisher == publisher }
//
//                    dismiss()
//                }
//                .padding()
//            }
//            Text("Filter by Alignment")
//                .font(.headline)
//                .padding()
//
//            ForEach(["good", "bad", "neutral"], id: \.self) { alignment in
//                Button(changeAlignmentFilterDescription(alignment)) {
//
//                    viewModel.characters = viewModel.characters.filter { $0.alignment == alignment }
//
//                    dismiss()
//                }
//                .padding()
//            }
//
//            Spacer()
//
//        }
//    }
//}
//
//func changeAlignmentFilterDescription(_ alignment: String) -> String {
//    switch alignment.lowercased() {
//        case "good":
//            return "Hero"
//        case "bad":
//            return "Villain"
//        case "neutral":
//            return "Anti-Hero"
//        default:
//            return "Unknown"
//    }
//}
                    // Implement filter logic based on publisher selection
                    // You can modify the CharacterViewModel to handle filtering
                    // This is just a placeholder
import SwiftUI

struct FilterOptionsView: View {
    @Environment(\.dismiss) private var dismiss

    @ObservedObject var viewModel: CharacterViewModel
    @ObservedObject var originalCharacterData: CharacterViewModel

    @Binding var filteredPublishers: Set<String>
    @Binding var filteredAlignments: Set<String>
    // Set to keep track of selected publishers and alignments
//    @State private var filteredCharacters: [Character] = []
//    @State private var selectedPublishers: Set<String> = []
//    @State private var selectedAlignments: Set<String> = []
//    @State private var isMarvelComicsSelected: Bool = true
//    @State private var isDCComicsSelected: Bool = true
//    @State private var isGoodAlignmentSelected: Bool = true
//    @State private var isBadAlignmentSelected: Bool = true
//    @State private var isNeutralAlignmentSelected: Bool = true


    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button("Reset") {
                    filteredPublishers = Set(["Marvel Comics", "DC Comics"])
                    filteredAlignments = Set(["good", "bad", "neutral"])
//                    isMarvelComicsSelected = false
//                    isDCComicsSelected = false
//                    isGoodAlignmentSelected = false
//                    isBadAlignmentSelected = false
//                    isNeutralAlignmentSelected = false
//                    resetToggles()
//                    // Clear the selected options
//                    selectedPublishers.removeAll()
//                    selectedAlignments.removeAll()
//
//                    // Also clear the selected options in the ViewModel
////                    viewModel.selectedPublishers = []
////                    viewModel.selectedAlignments = []
//
//                    dismiss()
                }
                .padding()
                Spacer()
                Button("Done") {
                    // Save the selected options here, if needed
                    // For example, you can update your ViewModel with the selections
//                     viewModel.selectedPublishers = Array(selectedPublishers)
//                     viewModel.selectedAlignments = Array(selectedAlignments)
                    
                    // Dismiss the view
                    dismiss()
                }
                .padding()
            }

            Text("Filter by Publisher")
                .font(.headline)
                .padding()
            Toggle(isOn: Binding(
                get: { filteredPublishers.contains("Marvel Comics") },
                set: { selected in
                    if selected {
                        filteredPublishers.insert("Marvel Comics")
                        filteredPublishers.insert("Rune King Thor")
                        filteredPublishers.insert("Giant-Man")
                    } else {
                        filteredPublishers.remove("Marvel Comics")
                        filteredPublishers.remove("Rune King Thor")
                        filteredPublishers.remove("Giant-Man")
                    }
                }
            )) {
                Text("Marvel Comics")
            }


//            Toggle(isOn: Binding $isMarvelComicsSelected(
//                get: { filteredPublishers.contains("Marvel Comics") },
//                set: { selected in
//                    if selected {
//                        filteredPublishers.insert("Marvel Comics")
//                        filteredPublishers.insert("Marvel Comics")
//                        filteredPublishers.insert("Rune King Thor")
//                        filteredPublishers.insert("Giant-Man")
//                    } else {
//                        filteredPublishers.remove("Marvel Comics")
//                        filteredPublishers.remove("Marvel Comics")
//                        filteredPublishers.remove("Rune King Thor")
//                        filteredPublishers.remove("Giant-Man")
//                    }
//                }
//            )) {
//                Text("Marvel Comics")
//            }
            .padding()

            Toggle(isOn: Binding(
                get: { filteredPublishers.contains("DC Comics") },
                set: { selected in
                    if selected {
                        filteredPublishers.insert("DC Comics")
                        // Include "Superman Prime One-Million" and "Oracle"
                        filteredPublishers.insert("Superman Prime One-Million")
                        filteredPublishers.insert("Oracle")
                        filteredPublishers.insert("Batman II")
                    } else {
                        filteredPublishers.remove("DC Comics")
                        // Remove "Superman Prime One-Million" and "Oracle"
                        filteredPublishers.remove("Superman Prime One-Million")
                        filteredPublishers.remove("Oracle")
                        filteredPublishers.remove("Batman II")
                    }
                }
            )) {
                Text("DC Comics")
            }
            .padding()
            
//            ForEach(["Superman Prime One-Million", "Oracle"], id: \.self) { publisher in
//                if filteredPublishers.contains("DC Comics") || filteredPublishers.contains(publisher) {
//                    Toggle(isOn: Binding(
//                        get: { filteredPublishers.contains(publisher) },
//                        set: { selected in
//                            if selected {
//                                filteredPublishers.insert(publisher)
//                            } else {
//                                filteredPublishers.remove(publisher)
//                            }
//                        }
//                    )) {
//                        Text(publisher)
//                    }
//                    .padding()
//                }
//            }
            
            Text("Filter by Alignment")
                .font(.headline)
                .padding()

            ForEach(["good", "bad", "neutral"], id: \.self) { alignment in
                Toggle(isOn: Binding(
                    get: { filteredAlignments.contains(alignment) },
                    set: { selected in
                        if selected {
                            filteredAlignments.insert(alignment)
                        } else {
                            filteredAlignments.remove(alignment)
                        }
                    }
                )) {
                    Text(changeAlignmentFilterDescription(alignment))
                }
                .padding()
            }

            Spacer()
        }
        .onDisappear {
            // Filter characters based on selected options when dismissing
            viewModel.characters = originalCharacterData.characters.filter { character in
                return filteredPublishers.isEmpty || filteredPublishers.contains(character.publisher)
            }
            .filter { character in
                return filteredAlignments.isEmpty || filteredAlignments.contains(character.alignment)
            }
        }
    }
    
    // Rest of your code...
    
//    private func resetToggles() {
//        filteredPublishers.removeAll()
//        filteredAlignments.removeAll()
//        isMarvelComicsSelected = true
//        isDCComicsSelected = true
//        isGoodAlignmentSelected = true
//        isBadAlignmentSelected = true
//        isNeutralAlignmentSelected = true
        //    filteredPublishers = Set(["Marvel Comics", "DC Comics"])
        //    filteredAlignments = Set(["good", "bad", "neutral"])
//    }
}

func changeAlignmentFilterDescription(_ alignment: String) -> String {
    switch alignment.lowercased() {
        case "good":
            return "Hero"
        case "bad":
            return "Villain"
        case "neutral":
            return "Anti-Hero"
        default:
            return "Unknown"
    }
}
