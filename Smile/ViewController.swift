//
//  ViewController.swift
//  Smile
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var selfieImageView: UIImageView!
    


    @IBAction func takePicButtonPressed(sender: AnyObject) {
        presentPicker()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
        self.selfieImageView.image = image
           self.dismissViewControllerAnimated(true, completion: nil)
            
            let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
            let faces = detector.featuresInImage(CIImage(image: image)!, options: [CIDetectorSmile:true]) as! [CIFaceFeature]
            for face in faces {
                let callout = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                callout.center = self.selfieImageView.center
                callout.text = face.hasSmile ? "😀" : "😐"
                
            
                
                selfieImageView.addSubview(callout)
            }
        }
    }


    func presentPicker() {
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
                self.imagePicker.sourceType = .Camera
                self.imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.Photo
        
                self.imagePicker.delegate = self
                
            }
                else {
            
            //allocate and initialize our UIImagePickerController
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePicker.delegate = self
           
        }
        self.presentViewController(imagePicker, animated: true, completion: nil)

    }
}

