//
//  ViewController.swift
//  NavigationControllerApp
//
//  Created by Pablo Ramirez Barrientos on 19/10/18.
//  Copyright © 2018 Pablo Ramirez Barrientos. All rights reserved.
//

import UIKit

class MainController: UIViewController, MainViewDelegate {

    var mainView: MainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initView()
    }
    
    func initView(){
        mainView.delegate = self
        
        self.title = "MainView"
        self.view.backgroundColor = UIColor.white
        self.view = mainView.initView(view: self.view)
        self.navigationItem.leftBarButtonItem = mainView.getLeftBarButtonItem()
        self.navigationItem.rightBarButtonItem = mainView.getRightBarButtonItem()
        
        
    }
    

    @objc func onButtonPressed(sender: UIButton){
        print("button pressed with tag \(sender.tag)")
        
        switch sender.tag {
        case 1:
            let loginVC = LoginController()
            self.navigationController?.pushViewController(loginVC, animated: true)
            //self.navigationController?.present(loginVC, animated: true, completion: nil)
            //self.present(loginVC, animated: true, completion: nil)
        case 2:
            let registerVC = RegisterController()
            self.navigationController?.pushViewController(registerVC, animated: true)
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

