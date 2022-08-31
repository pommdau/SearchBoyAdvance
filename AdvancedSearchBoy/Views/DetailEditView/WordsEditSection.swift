//
//  WordsEditSection.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/09/01.
//

import SwiftUI

struct WordsEditSection: View {
    
    let sectionTitle: String
    @Binding var words: [String]
    @State private var newWord = ""
    
    var body: some View {
        Section(sectionTitle) {
            ForEach(words, id: \.self) { word in
                Text(word)
            }
            .onDelete { indices in
                words.remove(atOffsets: indices)
            }

            HStack {
                TextField("New Word", text: $newWord)
                Button {
                    withAnimation {
                        words.append(newWord)
                        newWord = ""
                    }
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .disabled(newWord.isEmpty)
            }
        }
    }
}

struct WordsEditCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            WordsEditSection(sectionTitle: "Title",
                             words: .constant(["word1", "word2"]))
        }
    }
}
