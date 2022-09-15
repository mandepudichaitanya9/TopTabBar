//
//  ViewController1.swift
//  TabBarSelection
//
//  Created by chaitanya on 29/08/22.
//

import UIKit

class ViewController1: UIViewController {
    
    var customView = TabBarView()
    var customModel = EmailView()

    @IBOutlet weak var emailTapped: UIButton!
    @IBOutlet weak var phoneTapped: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // subViews()
        viewSetup()
    }
    
    
    
    
    
    func viewSetup(){
        self.customView = TabBarView(frame: CGRect(x: 0, y: 38, width: view.frame.width, height: view.frame.height))
        customView.photosBtn.addTarget(self, action: #selector(emailBtnTapped), for: .touchUpInside)
        customView.videoBtn.addTarget(self, action: #selector(phoneBtnTapped), for: .touchUpInside)
        customView.sendBtn.addTarget(self, action: #selector(sendotpBtn), for: .touchUpInside)
        customView.photosLbl.isHidden = true
        self.view.addSubview(customView)
    }
    @objc func emailBtnTapped(){
       
        customView.videoLbl.isHidden = true
        customView.photosLbl.isHidden = false
        customView.textField.isHidden = true
        customView.borderLbl.isHidden = true
        customView.sendBtn.isHidden = true
        subViews()
        
        //customView.removeFromSuperview()

    }
    @objc func phoneBtnTapped(){
        customView.photosLbl.isHidden = true
        customView.videoLbl.isHidden = false
        customView.textField.isHidden = false
        customView.borderLbl.isHidden = false
        customView.sendBtn.isHidden = false
        customModel.removeFromSuperview()
    }
    
    @objc func sendotpBtn(){
       let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let screen = storyBoard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        screen.name = "ajay"
        self.navigationController?.pushViewController(screen, animated: true)
    }
    
    @objc func loginBtnTapped(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
         let screen = storyBoard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
         screen.name = "ajay"
         self.navigationController?.pushViewController(screen, animated: true)
    }
    
    func subViews(){
        self.customModel = EmailView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height))
        customModel.loginBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
      customView.addSubview(customModel)
    }
    
}
