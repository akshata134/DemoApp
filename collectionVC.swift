//
//  collectionVC.swift
//  DemoApp
//
//  Created by Rajesh on 20/01/18.
//  Copyright © 2018 medipod. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import AlamofireImage

class collectionVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var nameArray = [String]()
    var authorarray = [String]()
    var descriptionarray = [String]()
    var imagearray = [String]()
    var publishedAtarray = [String]()
    var urlarray = [String]()
    var authors = [String]()
    var sendAuthor : String!
    var senddescription : String!
    var sendpublishedat :  String!
    var sendurl : String!
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionview.dataSource=self
        self.collectionview.delegate=self
      artical()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "collectionid", for:indexPath ) as! customCollectionviewcell
          let url=NSURL(string:self.imagearray[indexPath.row])
        cell.imagedata.af_setImage(withURL: url! as URL, placeholderImage:UIImage(named:"images"), filter: nil,imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion:nil )
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.lbloutlet.text = self.nameArray[indexPath.row]
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        var selectedIndex : Int!
        
        print("dasda",indexPath.row)
        
        selectedIndex = indexPath.row
        
        print("dasds",self.authorarray[selectedIndex])
        if (selectedIndex>=13 ) {
            
            print("nill")
        }else {
        let author = "\(self.authorarray[selectedIndex])"
        let description="\(self.descriptionarray[selectedIndex])"
       let publishat="\(self.publishedAtarray[selectedIndex])"
         let url="\(self.urlarray[selectedIndex])"
        sendAuthor = author
        senddescription = description
        sendpublishedat = publishat
        sendurl = url
        }
        self.performSegue(withIdentifier: "detailsid", sender: nil)
        
     
        
    }
    func artical(){
    
        
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=dbec6eb3b86e4faa8675168153276ac4"
       
        print(url)
        Alamofire.request(url , method: .get, parameters: nil ,  headers: nil).responseJSON{ (response) -> Void in
            
            
            
            switch(response.result) {
                
            case .success(_):
                let code = response.response?.statusCode
                switch(code)
                {
                    
                case 200?:
                    
                    if let JSON = response.result.value {
                        
                        let allServiceDict : NSDictionary = JSON as! NSDictionary
                        
                        print("dictionary : \(allServiceDict)")
                        
                        let dataArray = allServiceDict.object(forKey: "articles") as! NSArray
                        
                        print("data Array : \(dataArray)")
                        
                        for data in dataArray{
                            
                            let title = (data as AnyObject).value(forKey: "title") as? String
                            self.nameArray.append(title!)
                            print(self.nameArray)
                            
                           let image = (data as AnyObject).value(forKey: "urlToImage") as? String
                            if image == nil {
                             self.imagearray.append("")
                            }
                            else {
                            self.imagearray.append(image!)
                                
                            let image = (data as AnyObject).value(forKey: "urlToImage") as? String
                            print(image as Any)
                           
                            let author = (data as AnyObject).value(forKey: "author") as? String
                            if author == nil{
                                self.authorarray.append("")
                               print("nil")
                            }else{
                                self.authorarray.append(author!)
                                print(self.authorarray)
                                
                            }
                            let description = (data as AnyObject).value(forKey: "description") as? String
                            if description == nil{
                                 self.descriptionarray.append("")
                                print("nil")
                            }else{
                            self.descriptionarray.append(description!)
                            print( self.descriptionarray)
                            }
                            
                            let publishedAt = (data as AnyObject).value(forKey: "publishedAt") as? String
                            if publishedAt == nil {
                                 self.publishedAtarray.append("")
                                print("nill")
                            }else{
                            
                            self.publishedAtarray.append(publishedAt!)
                            print( self.publishedAtarray)
                            }
                            let url = (data as AnyObject).value(forKey: "url") as? String
                            if url == nil{
                                 self.urlarray.append("")
                                print("nil")
                            }else{
                            self.urlarray.append(url!)
                            print( self.urlarray)
                            }
                        }
                        
                        self.collectionview.reloadData()

                    }
                    else{
                        
                        
                        
                        
                    }
                    
                case 400? :
                    if let data=response.result.value{
                        self.alertMessageOk(title: "Failed", message: data as! String)
                    }
                    break
                    
                case 404?:
                    break
                case .none:
                    break
                case .some(_):
                    break
                }
                
                break
                
            case .failure(_):
                
                print("  sssss")
                
            }
        }
        
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailsid" {
            
            if let destination = segue.destination as? DetailsViewController {
                destination.sendAuthor = sendAuthor as String
                destination.senddescription = senddescription as String
                 destination.sendpublishedat = sendpublishedat as String
                destination.sendurl = sendurl as String
            }
            
        }
        else{
            
            
        }
      
    }
    
    }
 
    
    


