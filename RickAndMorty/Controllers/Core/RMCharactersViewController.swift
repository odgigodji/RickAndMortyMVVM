//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Namerei on 04.01.23.
//

import UIKit


/// Contoller to show and search Characters
final class RMCharactersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
        
        
        let request = RMRequest(endpoint: .character, pathComponent: ["1"], queryParametrs: [
            URLQueryItem(name: "name", value: "rick"),
            URLQueryItem(name: "status", value: "alive")
        ])
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
//            switch result {
//            case .success(result)
//            }
        }
    }

}
