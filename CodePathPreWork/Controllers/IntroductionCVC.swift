//
//  IntroductionCVC.swift
//  CodePathPreWork
//
//  Created by Aries Lam on 12/21/22.
//

import UIKit

class IntroductionCVC: UICollectionViewController {
    
    var dataArr = [StudentIntro]()
    var persistenceManager = PersistenceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    
    //MARK: - CollectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let introductionCell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroductionCell.reuseIdentifier, for: indexPath) as! IntroductionCell
            
        introductionCell.setLabelName(name: dataArr[indexPath.item].name!)
        introductionCell.setIntroductionTF(text: dataArr[indexPath.item].introduction!)
        
        introductionCell.layer.cornerRadius = 10
        introductionCell.layer.borderWidth  = 2
        introductionCell.layer.borderColor  = UIColor.systemCyan.cgColor
        introductionCell.delegate = self
        
        return introductionCell
        
    }
}

extension IntroductionCVC: IntroductionCellDelegate{
    
    //MARK: - Delete Items
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if let indexPaths = collectionView?.indexPathsForVisibleItems{
            for indexPath in indexPaths {
                if let cell = collectionView.cellForItem(at: indexPath) as? IntroductionCell{
                    cell.isEditing = editing
                }
            }
        }
    }
    
    
    func delIntroduction(cell: IntroductionCell) {
        if let indexPath = collectionView.indexPath(for: cell){
            
            let introToDel = dataArr[indexPath.item]
            dataArr.remove(at: indexPath.item)
            persistenceManager.delStudentIntro(intro: introToDel)
            collectionView.deleteItems(at: [indexPath])
        }
    }

}
