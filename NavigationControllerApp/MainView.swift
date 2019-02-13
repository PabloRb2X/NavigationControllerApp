//
//  MainView.swift
//  NavigationControllerApp
//
//  Created by Pablo Ramirez Barrientos on 19/10/18.
//  Copyright © 2018 Pablo Ramirez Barrientos. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewDelegate {
    func onButtonPressed(sender: UIButton)
}

public class MainView : UIView{
    
    var delegate: MainViewDelegate!
    
    let loginButton: UIButton = UIButton()
    let registerButton: UIButton = UIButton()
    
    func initView(view: UIView) -> UIView{
        
        loginButton.frame = CGRect(x: 0, y: 0, width: view.frame.width * 0.35, height: view.frame.height * 0.07)
        loginButton.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.5)
        loginButton.setTitle("Get pokemon!", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor.purple
        loginButton.contentHorizontalAlignment = .center
        loginButton.contentVerticalAlignment = .fill
        loginButton.tag = 1
        loginButton.layer.cornerRadius = 25
        loginButton.addTarget(self, action: #selector(onButtonPressed(sender:)), for: .touchUpInside)
        view.addSubview(loginButton)
        
        registerButton.frame = CGRect(x: 0, y: 0, width: view.frame.width * 0.35, height: view.frame.height * 0.07)
        registerButton.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.55)
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(UIColor.white, for: .normal)
        registerButton.backgroundColor = UIColor.purple
        registerButton.contentHorizontalAlignment = .center
        registerButton.contentVerticalAlignment = .fill
        registerButton.tag = 2
        registerButton.layer.cornerRadius = 25
        registerButton.addTarget(self, action: #selector(onButtonPressed(sender:)), for: .touchUpInside)
        //view.addSubview(registerButton)
        
        return view
    }
    
    @objc func onButtonPressed(sender: UIButton){
        delegate.onButtonPressed(sender: sender)
    }
    
    func getLeftBarButtonItem() -> UIBarButtonItem{
        let leftBarButtonItem = UIBarButtonItem(title: "Left Item", style: .plain, target: self, action: nil)
        leftBarButtonItem.tintColor = .red
        
        return leftBarButtonItem
    }
    
    func getRightBarButtonItem() -> UIBarButtonItem{
        let rightBarButtonItem = UIBarButtonItem(title: "Right Item", style: .plain, target: self, action: nil)
        rightBarButtonItem.tintColor = .red
        
        return rightBarButtonItem
    }
    
    
}
