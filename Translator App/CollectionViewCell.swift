//
//  CollectionViewCell.swift
//  Translator App
//
//  Created by ITLabAdmin on 7/26/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import AVFoundation

class CollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var russianTranslation: UILabel!
    @IBOutlet weak var englishTranslation: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    @IBAction func speechButton(_ sender: UIButton) {
        self.readText(text: englishTranslation.text!, lang: "en-US")

        
    }
    func readText(text: String, lang: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: lang)
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}
