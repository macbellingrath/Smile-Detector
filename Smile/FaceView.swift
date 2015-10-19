//
//  FaceView.swift
//  Smile
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class FaceView: UIView {

    
    var emoji: String?
    
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
     
        let emojilabel = UILabel(frame: rect)
        emojilabel.text = emoji!
        self.addSubview(emojilabel)
        
    }

}
