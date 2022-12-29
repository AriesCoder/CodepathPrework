//
//  IntroductionCell.swift
//  CodePathPreWork
//
//  Created by Aries Lam on 12/21/22.
//

import UIKit

class IntroductionCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var introductionTF: UITextView!

    func configureNameLabel(name: String){
        nameLabel.text = name
    }
    
    
    func configureIntroductionTF(text: String){
        introductionTF.text = text
    }

}
