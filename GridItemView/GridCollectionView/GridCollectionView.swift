//
//  GridCollectionView.swift
//  GridItemView
//
//  Created by Fran (A610851) on 11/04/2019.
//  Copyright © 2019 Fran (A610851). All rights reserved.
//

import UIKit

class GridCollectionView : UICollectionView, UICollectionViewDelegateFlowLayout {
    
    var dataArray: [Sport] = [];
    var itemViewName : String = "";
    
    @IBInspectable
    var cellMarginSize: CGFloat = 3.0
    
    @IBInspectable
    var cellCount: CGFloat = 3.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setUp(itemViewName: itemViewName)
    }
    
    func setUp(itemViewName: String) {
        // Set Delegates
        self.delegate = self
        self.dataSource = self
        
        // Register cells
        self.register(UINib(nibName: itemViewName, bundle: nil), forCellWithReuseIdentifier: itemViewName)
        
        // SetupGrid view
        self.setupGridView()
    }
    
    func setupGridView() {
        let flow = collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func setDataArray(data : [Sport]) {
        self.dataArray = data
    }
}

extension GridCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemViewName, for: indexPath) as! GridItemView
        cell.setItemName(text: self.dataArray[indexPath.row].name + " " + self.dataArray[indexPath.row].id)
        cell.iconImage.backgroundColor = UIColor.red
        
        return cell
    }
}

extension GridCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    func calculateWith() -> CGFloat {
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
    }
}
