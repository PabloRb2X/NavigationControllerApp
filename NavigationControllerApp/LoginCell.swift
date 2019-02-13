//
//  LoginCell.swift
//  NavigationControllerApp
//
//  Created by Pablo Ramirez Barrientos on 22/10/18.
//  Copyright © 2018 Pablo Ramirez Barrientos. All rights reserved.
//

import Foundation
import UIKit

public class LoginCell: UICollectionViewCell{
    
    var imageView: UIImageView = UIImageView()
    var textButton: UIButton = UIButton()
    
    func initLoginCell(){
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width * 0.4, height: self.frame.height * 0.8)
        imageView.center = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.4)
        imageView.contentMode = .scaleAspectFit
        //imageView.clipsToBounds = true
        self.addSubview(imageView)
        
        textButton.frame = CGRect(x: 0, y: imageView.frame.height, width: self.frame.width, height: self.frame.height * 0.2)
        textButton.setTitle("", for: .normal)
        textButton.setTitleColor(UIColor.black, for: .normal)
        textButton.titleLabel?.textAlignment = .center
        textButton.contentVerticalAlignment = .fill
        textButton.contentHorizontalAlignment = .center
        self.addSubview(textButton)
    }
}
