//
//  CharacterViewController.swift
//
//  Created by Joel de Almeida Souza on 11/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    
    @IBOutlet weak var nameCharacter: UILabel!
    
    @IBOutlet weak var descCharacter: UILabel!
    
    @IBOutlet weak var btnWebPage: UIButton!
    //selectedCharacter selecionado na lista
    var selectedCharacter: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let character = selectedCharacter{
            nameCharacter.text = character.name
            if let url = URL(string: character.thumbnail.getUrl()){
                imgCharacter.kf.indicatorType = .activity
                imgCharacter.kf.setImage(with: url)
            } else {
                imgCharacter.image = UIImage(named: "no_avatar")
            }
            descCharacter.text = !character.description.isEmpty ? character.description : "Personagem sem Descrição."
            if character.urls.count == 0{
                btnWebPage.isEnabled = false
                btnWebPage.setTitle("Personagem sem página", for: .disabled)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webPageCharacterSegue"{
            let view = segue.destination as! WebPageCharacterViewController
            view.character = self.selectedCharacter
        }
    }
    
     // MARK: - Navigation
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
