//
//  ViewController.swift
//  TabBarSelection
//
//  Created by chaitanya on 29/08/22.
//

import UIKit

class ViewController: UIViewController {
    var inventoryList:InventoryListView!
    var isRoom = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addInventoryListView()
        //showTabSelection()
    }

    func addInventoryListView() {
        let frame = CGRect(x: 0, y:50, width: self.view.frame.width, height: self.view.frame.height)
        self.inventoryList = InventoryListView(frame: frame, inView: self)
        self.inventoryList.roomsBtn.addTarget(self, action: #selector(roomsButtonAction), for:.touchUpInside)
        self.inventoryList.category.addTarget(self, action: #selector(categoryButtonAction), for: .touchUpInside)
        self.view.addSubview(self.inventoryList)
    }
    
    @objc func roomsButtonAction(){
        self.isRoom = true
        self.inventoryList.isVideos = true
        self.inventoryList.roomIndicator.isHidden = false
        self.inventoryList.categoryIndicator.isHidden = true
        self.inventoryList.collectionViews()
        self.inventoryList.reloadTableData()
    }
    
    
    @objc func categoryButtonAction(){
        self.isRoom = false
        self.inventoryList.isVideos = false
        self.inventoryList.roomIndicator.isHidden = true
        self.inventoryList.categoryIndicator.isHidden = false
        self.inventoryList.collectionViews()
        self.inventoryList.reloadTableData()
    }
    

}


