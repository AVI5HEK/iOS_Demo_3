//
//  File.swift
//  DelegateDemo
//
//  Created by framgia on 10/24/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

protocol PresentedViewControllerDelegate {
    func acceptData(data: AnyObject!)
}

class PresentedViewController: UIViewController {
    // create a variable that will recieve / send messages
    // between the view controllers.
    var delegate : PresentedViewControllerDelegate?
    // another data outlet
    var data : AnyObject?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isBeingDismissed {
            self.delegate?.acceptData(data: textField.text as AnyObject!)
        }
    }
    
    @IBAction func doDismiss(sender: AnyObject) {
        if (textField.text != "") {
            self.presentingViewController!.dismiss(animated: true, completion: nil)
        }
    }
}
