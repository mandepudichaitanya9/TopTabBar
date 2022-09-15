//
//  InventoryListView.swift
//  IMH
//
//  Created by Simbesi on 30/10/20.
//  Copyright © 2020 Simbesi. All rights reserved.
//

import UIKit

class InventoryListView: UIView {
    // MARK: - Variables
    weak fileprivate var vc: UIViewController!
    weak private var view: UIView!
    var data = [CategoryList]()
    var isVideos = true
    var isTable  = false
 
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var roomsBtn: UIButton!
    @IBOutlet weak var category: UIButton!
    @IBOutlet weak var roomIndicator: UILabel!
    @IBOutlet weak var categoryIndicator: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var styleBtn: UIButton!
   
    
    // MARK: - View
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, inView: UIViewController) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        // Init variables
        vc = inView
        registerTableViewCells()
       registerCollectionViewCells()
        
        fetchArrayjson { result in
            self.data = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    }
    
    private func xibSetup(frame: CGRect) {
        view = loadViewFromNib()
        // Adjust the view size for iPhone 6 and iPhone 6 plus
        view.frame = frame
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
        // Setup view
    }
    func registerTableViewCells() {
        tableView.register(UINib(nibName: "InventoryTableCell", bundle: nil), forCellReuseIdentifier: "InventoryTableCell")
    }
    
    
    func registerCollectionViewCells() {
        collectionView.register(UINib(nibName: "InventoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "InventoryCollectionCell")
        collectionView.register(UINib(nibName: "PhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotosCollectionViewCell")
    }
    
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "InventoryListView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func reloadTableData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func collectionViews() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    // MARK: - Button Actions
    
    @IBAction func filterButtonAction(_ sender: UIButton) {
        
    }
    
    func fetchArrayjson(completion: @escaping (_ result: [CategoryList]) -> (Void)){
            guard let fileLocation = Bundle.main.url(forResource: "simple", withExtension: "json") else {return}
            do {
              let data = try Data(contentsOf: fileLocation)
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
               
                let result = try JSONDecoder().decode(JsonModel.self, from: data)
                completion(result.categories)
                
                
                
    
            }catch {
                print("parsing error")
            }
    
        }
    
    
    
    
    @IBAction func styleButtonAction(_ sender: UIButton) {
        isTable = !isTable
        styleBtn.isSelected = isTable
        if isTable{
            self.view.bringSubviewToFront(tableView)
            self.view.sendSubviewToBack(collectionView)
            self.collectionView.isHidden = true
            self.tableView.isHidden = false
            self.reloadTableData()
        }else{
            self.view.bringSubviewToFront(collectionView)
            self.view.sendSubviewToBack(tableView)
            self.collectionView.isHidden = false
            self.tableView.isHidden = true
            self.collectionViews()
        }
        }
    }

    
//MARK: - UICollectionView Delegate
extension InventoryListView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // Return custom size for the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isVideos {
      // let yourWidth = collectionView.bounds.width / 2.15
        return CGSize(width: 350, height: 150)
        }else {
          return CGSize(width: 175, height: 175)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isVideos{
            return 10
        }else{
            return  data[section].videos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isVideos{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
            let videoData = data[indexPath.section].videos[indexPath.row]
          //  cell.titleLbl.text = "Chai" //videoData.title
            cell.images.downloaded(from: videoData.thumb)
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}



//MARK: - UITableViewDelegate & UITableViewDataSource

extension InventoryListView:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isVideos{
            return 10
        }else{
            return  1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryTableCell") as! InventoryTableCell
        if isVideos {
            cell.inventoryName.text = "Chaitanay"
        }else {
            cell.inventoryName.text = "Ashok"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return  0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return  10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

  



