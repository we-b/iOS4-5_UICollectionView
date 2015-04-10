//
//  CustomCell.swift
//  first_collectionView
//
//  Created by 松下慶大 on 2015/04/08.
//  Copyright (c) 2015年 matsushita keita. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet var image : UIImageView!
    
    override func awakeFromNib() {
        self.image.contentMode = UIViewContentMode.ScaleAspectFill
    }
}
