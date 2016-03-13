//
//  EditViewController.swift
//  MyPic
//
//  Created by madsid on 2/14/16.
//  Copyright © 2016 Citrus Designs. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var toPass:String!
    
    var detailsPlaceHolder = "Pease provide us the details"
    
    @IBOutlet weak var detailsTextView: UITextView!
    
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var additionalStackView: UIStackView!
    
    @IBOutlet weak var doneButton: UIToolbar!
    let imagePicker = UIImagePickerController()
    
    var firstfilled = false
    
    var x = CGFloat(0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        detailsTextView!.delegate = self
        detailsTextView.text = detailsPlaceHolder
        detailsTextView.textColor = UIColor.lightGrayColor()
        detailsTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        detailsTextView.layer.borderWidth = 1.0
        detailsTextView.layer.cornerRadius = 5
        
        imagePicker.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backPressed(sender: AnyObject) {
        //let vc = self.storyboard?.instantiateViewControllerWithIdentifier("MainView") as! MainViewController
        //vc.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        //self.presentViewController(vc, animated: true, completion: nil)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if detailsTextView.textColor == UIColor.lightGrayColor() {
            detailsTextView.text = ""
            detailsTextView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if detailsTextView.text.isEmpty {
            detailsTextView.text = detailsPlaceHolder
            detailsTextView.textColor = UIColor.lightGrayColor()
        }
    }
    
    @IBAction func donePressed(sender: AnyObject) {
        print("\(toPass) and data")
        print(firstImage.image)
    }
    
    @IBAction func cameraPressed(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func albumPressed(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if(firstfilled == false){
                firstImage.contentMode = .ScaleAspectFit
                firstImage.image = pickedImage
                //firstfilled = true
            }
            else{
                let newImageView = UIImageView(frame: CGRectMake(x, 0, 100 , 100))
                newImageView.image = pickedImage
                newImageView.contentMode = .ScaleAspectFit
                additionalStackView.addSubview(newImageView)
                x = CGFloat(x + 108)
            }
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
