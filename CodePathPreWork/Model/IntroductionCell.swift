//
//  IntroductionCell.swift
//  CodePathPreWork
//
//  Created by Aries Lam on 12/21/22.
//

import UIKit

protocol IntroductionCellDelegate: class {
    func delIntroduction(cell: IntroductionCell)
}

class IntroductionCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var introductionTF: UITextView!
    @IBOutlet weak var delBtnView: UIVisualEffectView!
    
    static let reuseIdentifier = "Cell"
    
    weak var delegate: IntroductionCellDelegate?
    
    var isEditing: Bool = false {
        didSet{
            delBtnView.isHidden = !isEditing
        }
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
       configureDelBtn()
    }
    

    @IBAction func delBtnDidTapped(_ sender: Any) {
        
        delegate?.delIntroduction(cell: self)
    }
    
    
    func setLabelName(name: String){
        
        nameLabel.text = name
    }
    
    
    func setIntroductionTF(text: String){
        
        introductionTF.text = text
    }
    
    
    func configureDelBtn(){
        
        delBtnView.layer.cornerRadius   = delBtnView.bounds.width/2.0
        delBtnView.layer.masksToBounds  = true
        delBtnView.isHidden             = !isEditing
    }
    
    
    

}
