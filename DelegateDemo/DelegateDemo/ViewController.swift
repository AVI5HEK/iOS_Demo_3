//
//  ViewController.swift
//  DelegateDemo
//
//  Created by framgia on 10/24/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PresentedViewControllerDelegate {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doPresent(sender: AnyObject) {
        let pvc = storyboard?.instantiateViewController(withIdentifier: "PresentedViewController") as! PresentedViewController
        pvc.data = "important data sent via delegate!" as AnyObject?
        pvc.delegate = self
        self.present(pvc, animated: true, completion: nil)
    }
    
    func acceptData(data: AnyObject!) {
        label.text = data as! String?
    }

}
