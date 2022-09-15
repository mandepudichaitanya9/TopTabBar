//
//  TabBarView.swift
//  TabBarSelection
//
//  Created by chaitanya on 29/08/22.
//

import UIKit

class TabBarView: UIView {
    var view:UIView!

    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var borderLbl: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var photosBtn: UIButton!
    @IBOutlet weak var videoLbl: UILabel!
    @IBOutlet weak var photosLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TabBarView", bundle: bundle)
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
}


extension TabBarView:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


extension TabBarView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
