//
//  DetailsViewController.swift
//  DemoApp
//
//  Created by Rajesh on 22/01/18.
//  Copyright © 2018 medipod. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

   
    var Authorarray = [String]()
    var Descriptionarray = [String]()
    var PublishedAtarray = [String]()
    var Urlarray = [String]()
    
    internal var sendAuthor : String!
    internal var senddescription : String!
    internal var sendpublishedat : String!
    internal var sendurl : String!
    
    @IBOutlet weak var Author: UILabel!
    @IBOutlet weak var PublishedAt: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var URL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(sendAuthor)
        print(senddescription)
        Author.text = sendAuthor
        Description.text = senddescription
        PublishedAt.text = sendpublishedat
        URL.text = sendurl
    }

   
    @IBAction func BackBtn_Clicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
