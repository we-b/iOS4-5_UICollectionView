//
//  ViewController.swift
//  first_collectionView
//
//  Created by 松下慶大 on 2015/04/08.
//  Copyright (c) 2015年 matsushita keita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var collectionView: UICollectionView!

    var images = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
    let backgroundView = UIView()
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        
        backgroundView.frame = self.view.frame
        backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.layer.masksToBounds = true
    }
    
    //セルの数を設定
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //セルの内容を設定
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CustomCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as CustomCell
        cell.image.image = UIImage(named: images[indexPath.item])
        return cell
    }
    
    //セルがタップされた時に呼ばれるメソッド
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.view.addSubview(backgroundView)
        let gesture = UITapGestureRecognizer(target: self, action: "tapBackgroundView")
        backgroundView.addGestureRecognizer(gesture)

        displayImageView(imageView, indexPath: indexPath)
        let frame = backgroundView.convertRect(imageView.frame, fromView: collectionView)
        imageView.frame = frame
        
        //アニメーション
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: nil,
            animations: { () -> Void in
                self.imageView.frame.size = CGSizeMake(self.view.frame.width, 300)
                self.imageView.center = self.view.center
            }, completion: nil)
    }
    
    //ImageViewの表示
    func displayImageView(imageView: UIImageView, indexPath: NSIndexPath)  {
        imageView.frame = collectionView.cellForItemAtIndexPath(indexPath)!.frame
        println("セルの座標\(collectionView.cellForItemAtIndexPath(indexPath)!.frame)")
        imageView.image =  UIImage(named: images[indexPath.item])
        backgroundView.addSubview(imageView)
    }
    
    func tapBackgroundView() {
        backgroundView.removeFromSuperview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

