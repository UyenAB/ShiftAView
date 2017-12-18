//
//  ViewController.swift
//  [Demo]Shift a view
//
//  Created by admin on 12/5/16.
//  Copyright © 2016 LEVUANHUYEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet var imagePickerView: UIImageView!
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
//MARK: MOVE THE VIEW
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }

    func keyboardWillShow(notification: Notification){
        
        if textField.isFirstResponder{
        
        self.view.frame.origin.y -= getKeyboardHeight(notification as Notification)
        }
    } //move the view when keyboard cover textfield (Show KB)
    
    
    func  keyboardWillHide(notification: Notification) {
         if textField.isFirstResponder{
        self.view.frame.origin.y += getKeyboardHeight(notification as Notification)
        }
        
    }
    

    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    } //get keyboard height

    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillShow:")), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: Selector (("keyboardWillHide:")), name: .UIKeyboardWillHide, object: nil)
        
    } //know when keyboard is about to slide up
    
    
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        
    }

    
//MARK: Image Picker
    
//    @IBAction func pickAnImage() {
//        let imageLink = UIImagePickerController()
//        imageLink.delegate = self
//     
//        present(imageLink, animated: true, completion: nil)
//    } ///Present the image picker, and access to Photo Library to pick image, add new row in info.plist
//    
//    
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let imagePick = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            imagePickerView.image = imagePick
//            dismiss(animated: true, completion: nil)
//        }//pick original image from Photo Library
//        
//        
//        func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
//            
//            dismiss(animated: true, completion: nil)
//        } //cancelled the pick operation.
//        
//        
//    }

    
}

