//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Namerei on 09.01.23.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    
    let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    var title: String {
        character.name.uppercased()
    }
}
