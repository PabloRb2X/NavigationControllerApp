 //
//  LoginController.swift
//  NavigationControllerApp
//
//  Created by Pablo Ramirez Barrientos on 19/10/18.
//  Copyright © 2018 Pablo Ramirez Barrientos. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class LoginController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionLoginView: UICollectionView!
    var loginView: LoginView = LoginView()
    var loginModel: LoginModel = LoginModel()
    
    var jsonArray: NSArray?
    var nameArray: Array<String> = []
    var imageURLArray: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initLoginView()
    }
    
    func initLoginView(){
        self.view = loginView.initLoginView(view: self.view)
        
        collectionLoginView = loginView.collectionView
        collectionLoginView.dataSource = self
        collectionLoginView.delegate = self
        collectionLoginView.register(LoginCell.self, forCellWithReuseIdentifier: "cell")
        collectionLoginView.backgroundColor = UIColor.gray
        
        loginModel.downloadDataFromAPI(loginController: self)
    }
    
    func initData(jsonArray: NSArray, nameArray: Array<String>, imageURLArray: Array<String>){
        loginView.hideSubview(tag: 101, view: self.view)
        
        self.jsonArray = jsonArray
        self.nameArray = nameArray
        self.imageURLArray = imageURLArray
        
        collectionLoginView.reloadData()
        
        loginModel.loginWebService(user: "xuVFjNsW3dT7unI+Ysfmjw==", password: "CMU3N995N59Fhb0K1BSthQ==")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: CollectionView Functions
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LoginCell
        
        cell.initLoginCell()
        cell.backgroundColor = .white
        
        let url = URL(string: self.imageURLArray[indexPath.row])
        cell.imageView.af_setImage(withURL: url!)
        
        cell.textButton.setTitle(self.nameArray[indexPath.row], for: .normal)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let registerController = RegisterController()
        registerController.text = "jjjjj"
        self.navigationController?.pushViewController(registerController, animated: true)
    }
    
/*
    @objc func nextController(sender: UIButton){
        let registerController = RegisterController()
        self.navigationController?.pushViewController(registerController, animated: true)
    }
*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
