//
//  ViewController.swift
//  GridViewExampleApp
//
//  Created by Chandimal, Sameera on 12/22/17.
//  Copyright © 2017 Pearson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridCollectionView: GridCollectionView!
    
    var sports: [Sport]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSports();
        
        self.gridCollectionView.setDataArray(data: sports!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.gridCollectionView.setupGridView()
        DispatchQueue.main.async {
            self.gridCollectionView.reloadData()
        }
    }
    
    func initSports() {
        self.sports = (self.loadJson(filename: "sports")?.sports)![0]
    }
    
    func loadJson(filename fileName: String) -> Sports? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Sports.self, from: data)
                return jsonData
            } catch {
                print("Error Reading Data:\(error)")
            }
        }
        return nil
    }
}
