//
//  ViewController.swift
//  NewFoodTracker
//
//  Created by Farouk Talatini on 9/22/19.
//  Copyright © 2019 Farouk Talatini. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        /*
         The self refers to the ViewController class, because it’s referenced inside the scope of the ViewController class definition.
         */
        // Do any additional setup after loading the view.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        return true
        /*
         This method returns a Boolean value that indicates whether the system should process the press of the Return key. In this case, you always want to respond to the user pressing the Return key, so just return
         */
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
        
        /*
         imagePickerControllerDidCancel(_:), gets called when a user taps the image picker’s Cancel button. This method gives you a chance to dismiss the UIImagePickerController (and optionally, do any necessary cleanup).
         */
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey   : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer){
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        /*
         This code ensures that if the user taps the image view while typing in the text field, the keyboard is dismissed properly.
         */
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        /*
         This line of code sets the image picker controller’s source, or the place where it gets its images. The .photoLibrary option uses the simulator’s camera roll.
         */
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
        
        /*
         present(_:animated:completion:) is a method being called on ViewController. Although it’s not written explicitly, this method is executed on an implicit self object. The method asks ViewController to present the view controller defined by imagePickerController. Passing true to the animated parameter animates the presentation of the image picker controller. The completion parameter refers to a completion handler, a piece of code that executes after this method completes. Because you don’t need to do anything else, you indicate that you don’t need to execute a completion handler by passing in nil.
         */
    }
    
}

