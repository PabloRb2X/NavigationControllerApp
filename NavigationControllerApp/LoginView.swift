//
//  LoginView.swift
//  NavigationControllerApp
//
//  Created by Pablo Ramirez Barrientos on 22/10/18.
//  Copyright © 2018 Pablo Ramirez Barrientos. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewDelegate {
    
}

public class LoginView: UIView{
    
    var delegate: LoginViewDelegate!
    var collectionView: UICollectionView!
    let indicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func initLoginView(view: UIView) -> UIView{
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height * 0.33)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        collectionView.tag = 100
        view.addSubview(collectionView)
        
        indicatorView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        indicatorView.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.5)
        indicatorView.activityIndicatorViewStyle = .gray
        indicatorView.tag = 101
        indicatorView.startAnimating()
        view.addSubview(indicatorView)
        
        return view
    }
    
    func hideSubview(tag: Int, view: UIView){
        for subview in view.subviews where subview.tag == tag{
            subview.removeFromSuperview()
        }
    }
    
    
}
