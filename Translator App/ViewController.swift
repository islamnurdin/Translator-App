//
//  ViewController.swift
//  Translator App
//
//  Created by ITLabAdmin on 7/24/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var ruLabelView: UIView!
    @IBOutlet weak var enLabelView: UIView!
    @IBOutlet weak var ruTextField: UITextField!
    @IBOutlet weak var enLabel: UILabel!
    @IBOutlet weak var translateButton: UIImageView!
    @IBOutlet weak var historyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "iTranslator"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
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
}

extension UIView {
    func applyStylesViews() {
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor(red:0.54, green:0.79, blue:0.79, alpha:1.0).cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.5
    }
}

extension UIImageView {
    func applyStyleTranslate() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.backgroundColor = UIColor(red:0.45, green:0.88, blue:0.88, alpha:1.0).cgColor
    }
}

extension UIButton {
    func applyStyleButton() {
        self.backgroundColor = UIColor(red:0.45, green:0.88, blue:0.88, alpha:1.0)
        self.layer.cornerRadius = 4
        self.setTitle("Посмотреть историю", for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
    }
}








