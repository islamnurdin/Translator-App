//
//  ViewController.swift
//  Translator App
//
//  Created by ITLabAdmin on 7/24/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import Alamofire
import AVFoundation

struct ModelDecodable: Decodable {
    let text: [String]
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ruLabelView: UIView!
    @IBOutlet weak var enLabelView: UIView!
    @IBOutlet weak var ruTextField: UITextField!
    @IBOutlet weak var enLabel: UILabel!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    var model: ModelDecodable?
    
    var copiedTexts: HistoryObject = HistoryObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ruTextField.delegate = self
        
        navigationItem.title = "iTranslator"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        ruLabelView.applyStylesViews()
        enLabelView.applyStylesViews()
        translateButton.applyStyleButton()
        historyButton.applyStyleButton()

    }
    
    @IBAction func openShit(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func translateButtonClicked(_ sender: UIButton) {
        translate{
            print("translated")
        }
        copiedTexts.wordsInEnglish.append(self.enLabel.text!)
        copiedTexts.wordsInRussian.append(self.ruTextField.text!)
        
        print("\(copiedTexts.wordsInRussian.count) - \(copiedTexts.wordsInRussian.count)")

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ruTextField.resignFirstResponder()
        return true
    }

    func translate(completed : @escaping ()->()) {
        let myText = ruTextField.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let urlString = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20180724T104051Z.1663428093231832.ebdc3eea438a213931ad7b1d1c102add6ffa9f5e&text=\(myText ?? "")&lang=ru-en"
        let url = URL(string: urlString)
        Alamofire.request(url!).validate().responseJSON { (response) in
            let data = response.data
            do {
                let decoder = JSONDecoder()
                self.model = try decoder.decode(ModelDecodable.self, from: data!)
                self.enLabel.text = self.model?.text.first
                DispatchQueue.main.async {
                    completed()
                }
            } catch let e {
                print(e)
            }
        }
    }
    
    @IBAction func speechButton(_ sender: UIButton) {
        self.readText(text: enLabel.text!, lang: "en-US")
        
    }
    func readText(text: String, lang: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: lang)
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}




