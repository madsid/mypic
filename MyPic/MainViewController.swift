//
//  MainViewController.swift
//  MyPic
//
//  Created by madsid on 2/14/16.
//  Copyright © 2016 Citrus Designs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var frameButton: UIButton!
    @IBOutlet weak var sketchButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    @IBAction func editButtonPressed(sender: AnyObject) {
        displayViewController("Edit Button");
    }
    
    @IBAction func frameButtonPressed(sender: AnyObject) {
        displayViewController("Frame Button");
    }
    
    @IBAction func sketchButtonPressed(sender: AnyObject) {
        displayViewController("Sketch Button");
    }
    @IBAction func restoreButtonPressed(sender: AnyObject) {
        displayViewController("Restore Button");
    }
    
    func displayViewController(Value:String){
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("PictureDetailView") as! EditViewController
        vc.toPass = Value
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!  )
        
        editButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        frameButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        sketchButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        restoreButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
