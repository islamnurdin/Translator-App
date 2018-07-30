//
//  FViewController.swift
//  Translator App
//
//  Created by ITLabAdmin on 7/24/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import Foundation
import UIKit

class FViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    var vc = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(vc.copiedTexts.wordsInEnglish.count)
        navigationItem.title = "iTranslator"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vc.copiedTexts.wordsInEnglish.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.englishTranslation.textColor = UIColor(red:0.45, green:0.88, blue:0.88, alpha:1.0)
        
        //cell.englishTranslation.text = vc.arr[indexPath.row]
        cell.cellView.applyStylesViews()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height/4.2)
    }
    
}
