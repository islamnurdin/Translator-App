//
//  FViewController.swift
//  Translator App
//
//  Created by ITLabAdmin on 7/24/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//
import UIKit

class FViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
      var ruTranslatedWordsArray: [String] = []
//    var enTranslatedWordsArray: [String] = []
//
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "iTranslator"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  UserDefaults.standard.stringArray(forKey: "ruwords")!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.englishTranslation.textColor = UIColor(red:0.45, green:0.88, blue:0.88, alpha:1.0)
        cell.russianTranslation.textColor = .black
        let userDefaults = UserDefaults.standard
        cell.englishTranslation.text = userDefaults.stringArray(forKey: "enwords")?[indexPath.row]
        cell.russianTranslation.text = userDefaults.stringArray(forKey: "ruwords")?[indexPath.row]
        cell.cellView.applyStylesViews()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height/4.2)
    }
    
}
