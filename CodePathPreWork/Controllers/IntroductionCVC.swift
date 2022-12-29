//
//  IntroductionCVC.swift
//  CodePathPreWork
//
//  Created by Aries Lam on 12/21/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class IntroductionCVC: UICollectionViewController {
    
    var dataArr = [StudentIntro]()
    var persistenceManager = PersistenceManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func deleteTapped(_ sender: Any) {
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let introductionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! IntroductionCell
            
        introductionCell.configureNameLabel(name: dataArr[indexPath.row].name!)
        introductionCell.configureIntroductionTF(text: dataArr[indexPath.row].introduction!)
        
        introductionCell.layer.cornerRadius = 10
        introductionCell.layer.borderWidth  = 2
        
        return introductionCell
        
    }
        
    
   
 

}
