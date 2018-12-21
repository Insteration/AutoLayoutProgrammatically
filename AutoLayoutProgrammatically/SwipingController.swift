//
//  SwipingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Артём Кармазь on 12/21/18.
//  Copyright © 2018 Артём Кармазь. All rights reserved.
//

import UIKit

struct Page {
    
    let imageName: String
    let headerText: String
    let bodyText: String
    
}

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "mishalov", headerText: "Join us today in out", bodyText: "Coming soon to rada!"),
        Page(imageName: "petrenko", headerText: "More bitcoins and keepers slicly", bodyText: "Hey YOOOO!"),
        Page(imageName: "shishkin", headerText: "Wash informator out VIP", bodyText: "OOPS KASHER"),
        Page(imageName: "shevchuk", headerText: "Granade!!!!!!!!", bodyText: "BURN IN MONEY")
    ]
    
    //    let imageNames = ["mishalov", "petrenko", "shishkin", "shevchuk"]
    //    let headerStrings = ["Join us today in out", "More bitcoins and keepers slicly", "Wash informator out VIP", "Granade!!!!!!!!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    // delete spacing tab when swiping cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        
//        cell.bearImageView.image = UIImage(named: page.imageName)
//        cell.descriptionTextView.text = page.headerText
        
        //        let imageName = imageNames[indexPath.item]
        //        cell.bearImageView.image = UIImage(named: imageName)
        //        cell.descriptionTextView.text = headerStrings[indexPath.item]
        
        //  definitely don't try this, it is a very bad idea!!!!!
        //        let imageView = UIImageView()
        //        cell.addSubview(imageView)
        
        // added random color for cell - red - green - red - green etc
        //        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
    // cell on fullscreen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
        //        return CGSize(width: 100, height: 100)
    }
}
