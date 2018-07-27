//
//  ViewController.swift
//  Translator App
//
//  Created by ITLabAdmin on 7/24/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import Alamofire

struct ModelDecodable: Codable {
    let code: Int?
    let lang: String?
    let text: [Text]?
}

/*
 {"code":200,"lang":"ru-en","text":["hi"]}
 */

struct Text: Codable{
    let text: String
    enum CodingKeys: String, CodingKey {
        case text = "text"
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ruLabelView: UIView!
    @IBOutlet weak var enLabelView: UIView!
    @IBOutlet weak var ruTextField: UITextField!
    @IBOutlet weak var enLabel: UILabel!
    @IBOutlet weak var translateButton: UIImageView!
    @IBOutlet weak var historyButton: UIButton!
    
    var model: ModelDecodable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.ruTextField.delegate = self
        navigationItem.title = "iTranslator"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.translate(gesture:completed:)))
        translateButton.addGestureRecognizer(tapGesture)
        translateButton.isUserInteractionEnabled = true
        
        ruLabelView.applyStylesViews()
        enLabelView.applyStylesViews()
        translateButton.applyStyleTranslate()
        historyButton.applyStyleButton()

    }
    
    @IBAction func openShit(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ruTextField.resignFirstResponder()
        return true
    }
    
    
    @objc func translate(gesture: UIGestureRecognizer, completed : @escaping ()->()) {
        //let myText = ruTextField.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let urlString = "https://translate.yandex.net/api/v1.5/tr/translate?lang=ru-en&key=trnsl.1.1.20180724T104051Z.1663428093231832.ebdc3eea438a213931ad7b1d1c102add6ffa9f5e"
        
            Alamofire.request(urlString, method: .post, parameters: ["text" : [ruTextField.text!]] ).responseJSON { response in
            do {
                let data = response.data
                self.model = try JSONDecoder().decode(ModelDecodable.self, from: data!)
                print(self.model?.lang ?? "")
            } catch let e {
                print(e)
            }
        }
//        if (gesture.view as? UIImageView) != nil {
//            Alamofire.request(urlString).validate().responseJSON { (response) in
//                let result = response.data
//                do {
//                    let decoder = JSONDecoder()
//                    print(response.result)
//                    self.model = try decoder.decode(ModelDecodable.self, from: result!)
//                    print(self.model?.lang ?? "")
//                } catch(let err) {
//                    print("error", err.localizedDescription)
//                }
//                DispatchQueue.main.async {
//                    completed()
//                }
//            }
//        }

    }
    
}






