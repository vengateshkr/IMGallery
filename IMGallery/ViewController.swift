//
//  ViewController.swift
//  IMGallery
//
//  Created by Venkatesh on 16/06/18.
//  Copyright © 2018 Venkatesh. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
//        APIManager.fetchAPI { [weak self] (data, error) in
//            if let data = data {
//                self?.parseData(data)
//            }
//            if let error = error {
//                print(error.localizedDescription)
//            }
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseData(_ data : Data) {
        if let apiData = APIDataModel.loadAlbumModel(data: data) {
            
        }
    }
    
    // MARK: - UICollectionView Delegates
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/2.0
        let yourHeight = yourWidth
        
        return CGSize(width: 40, height: 40) // Return any non-zero size here
        //return CGSize(width: yourWidth, height: yourHeight)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagecell", for: indexPath) as! ImageCollectionViewCell
        return cell
    }
}
