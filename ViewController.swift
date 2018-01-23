//
//  ViewController.swift
//  DemoApp
//
//  Created by Rajesh on 20/01/18.
//  Copyright © 2018 medipod. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var username: PaddedTextFiled!
    @IBOutlet weak var password: PaddedTextFiled!
    override func viewDidLoad() {
        super.viewDidLoad()
        password.keyboardType=UIKeyboardType.numberPad
          password.delegate = self
        login()
       print(login())
    }

    func login(){
       username.text="akshata.k@gmail.com"
        password.text="1234"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = password.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= 4
    }
    
    @IBAction func Login_clicked(_ sender: Any) {
        if (username.text! as String).condenseWhitespace() == "" {
            self.alertMessageOk(title: "", message: "Please Enter Username!")
        }
        if (password.text! as String).condenseWhitespace() == "" {
            
            self.alertMessageOk(title: "", message: "Please Enter Password!")
        }
        else{
            if(((username.text?.elementsEqual("akshata.k@gmail.com"))!) && (password.text?.elementsEqual("1234"))!){
               login()
            }
            else{
                self.alertMessageOk(title: "", message: "Invalid Username or password!")
            }
        }
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func alertMessageOk(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func alertAndDismiss(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: .default){
            UIAlertAction in
            self.dismiss()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func dismiss(){
        self.dismiss(animated: true, completion: nil)
    }
}


