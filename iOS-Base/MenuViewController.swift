//
//  MenuViewController.swift
//  iOS-Base
//
//  Created by Helmi Akbar on 18/10/18.
//  Copyright © 2018 Lutfi Azhar. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var alphaLine: UIView!
    @IBOutlet weak var betaLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.view.alpha = 1.0
        
        self.alphaLine.isHidden = false
        self.betaLine.isHidden = true
    }
    
    //MARK: - ButtonAction
    @IBAction func closeMenuBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func alphaBtn(_ sender: Any) {
        self.alphaLine.isHidden = false
        self.betaLine.isHidden = true
        self.menuCollectionView.reloadData()
    }
    
    @IBAction func betaBtn(_ sender: Any) {
        self.alphaLine.isHidden = true
        self.betaLine.isHidden = false
        self.menuCollectionView.reloadData()
    }
    
    //MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MenuCollectionViewCell
        if self.alphaLine.isHidden == false {
            cell.indexLbl.text = "Alpha \(indexPath.row)"
        } else {
            cell.indexLbl.text = "Beta \(indexPath.row)"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.menuCollectionView.frame.width/4, height:self.menuCollectionView.frame.height)
    }

}
