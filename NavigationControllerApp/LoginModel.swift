//
//  loginModel.swift
//  NavigationControllerApp
//
//  Created by Pablo Ramirez Barrientos on 22/10/18.
//  Copyright © 2018 Pablo Ramirez Barrientos. All rights reserved.
//

import Foundation
import Alamofire

public class LoginModel: NSObject{
    
    var jsonArray: NSArray?
    var nameArray: Array<String> = []
    var imageURLArray: Array<String> = []
    
    func downloadDataFromAPI(loginController: LoginController){
        
        Alamofire.request("http://private-b6be82-pabloramirez1.apiary-mock.com/pokemonList").responseJSON { response in
            
            if let JSON = response.result.value{
                
                self.jsonArray = JSON as? NSArray
                //4.
                for item in self.jsonArray! as! [NSDictionary]{
                    
                    let name = item["name"] as? String
                    let imageURL = item["image"] as? String
                    self.nameArray.append((name)!)
                    self.imageURLArray.append((imageURL)!)
                }
                
                
                //self.collectionLoginView.reloadData()
                loginController.initData(jsonArray: self.jsonArray!, nameArray: self.nameArray, imageURLArray: self.imageURLArray)
                
            }
        }
    }
    
    func loginWebService(user: String, password: String){
        
        let parameters = [
            "usuario": user,
            "pwd": password
        ]

        var request = URLRequest(url: URL(string: "https://app-emp.telmex.com:7115/WSConmigoUsuario/login")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = 59
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [.prettyPrinted])
        
        /*
        let configuration: URLSessionConfiguration =g URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 59.0
        configuration.timeoutIntervalForResource = 59.0
        
        let alamofireManager = Alamofire.SessionManager(configuration: configuration)
    
        
        alamofireManager.request("https://app-emp.telmex.com:7115/WSConmigoUsuario/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in*/
        Alamofire.request(request as! URLRequestConvertible).responseJSON { (response) in
            
            switch(response.result){
            case .success:
                print("success")
            case .failure:
                print("failure")
            }
            
            if let JSON = response.result.value{
                print(JSON)
                let jsArray = JSON as! [String:AnyObject]
                print("descripcion = \(jsArray["description"]!)")
                
                
            }
            
        }
    }
    
}





















