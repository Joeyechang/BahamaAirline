//
//  ViewController.swift
//  BahamaAirline
//
//  Created by chang on 2018/5/31.
//  Copyright © 2018年 chang. All rights reserved.
//

import UIKit

// A delay function
func delay(_ seconds: Double, completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}


class ViewController: UIViewController {

    // MARK: IB outlets
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var heading: UILabel!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var cloud1: UIImageView!
    @IBOutlet var cloud2: UIImageView!
    @IBOutlet var cloud3: UIImageView!
    @IBOutlet var cloud4: UIImageView!
    
    // MARK: further UI
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    let status = UIImageView(image: UIImage(named: "banner"))
    let label = UILabel()
    let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
    
    var statusPosition = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up the UI
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true
        
        spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
        spinner.startAnimating()
        spinner.alpha = 0.0
        loginButton.addSubview(spinner)
        
        status.isHidden = true
        status.center = loginButton.center
        view.addSubview(status)
        
        label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
        label.font = UIFont(name: "HelveticaNeue", size: 18.0)
        label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
        label.textAlignment = .center
        status.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        heading.center.x -= view.bounds.width
        username.center.x -= view.bounds.width
        password.center.x -= view.bounds.width
        
        cloud1.alpha = 0.0
        cloud2.alpha = 0.0
        cloud3.alpha = 0.0
        cloud4.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) {
            self.heading.center.x += self.view.bounds.width
        }
        
        // withDuration: 动画时间
        // delay: 延迟执行
        // options: Lets you customize a number of aspects about your animation.
        // animations: The closure expression to provide your animations.
        // completion: A code closure to execute when the animation completes. This parameter often comes in handy when you want to perform some ﬁnal cleanup tasks or chain animations one after the other.
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.username.center.x += self.view.bounds.width
        },
        completion: nil )
        
        UIView.animate(withDuration: 0.5, delay: 0.4,
           options: [],//.repeat, .autoreverse
           animations: {
            self.password.center.x += self.view.bounds.width
        },
        completion: nil )
        
        // cloud 显示
        UIView.animate(withDuration: 0.5, delay: 0.4,
                       options: [],
                       animations: {
                        self.cloud1.alpha = 1.0
        },
                       completion: nil )
        UIView.animate(withDuration: 0.5, delay: 0.7,
                       options: [],
                       animations: {
                       self.cloud2.alpha = 1.0
        },
                       completion: nil )
        UIView.animate(withDuration: 0.5, delay: 0.9,
                       options: [],
                       animations: {
                       self.cloud3.alpha = 1.0
        },
                       completion: nil )
        UIView.animate(withDuration: 0.5, delay: 1.1,
                       options: [],
                       animations: {
                       self.cloud4.alpha = 1.0
        },
                       completion: nil )
        
    }
    
    // MARK: further methods
    
    @IBAction func login() {
        view.endEditing(true)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextField = (textField === username) ? password : username
        nextField?.becomeFirstResponder()
        return true
    }

}

