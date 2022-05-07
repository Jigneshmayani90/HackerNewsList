//
//  NewsShadowBG.swift
//  News
//
//  Created by Rahul Mayani on 24/04/21.
//

import UIKit

class NewsShadowBG: UIView {

    // MARK: - IBOutlet -
    
    // MARK: - Variable -
    
    // MARK: - Others -
    
    // MARK: - View Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5.0
        
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 0.3)
        layer.shadowRadius = 5
    }
}
