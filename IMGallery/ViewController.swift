//
//  ViewController.swift
//  IMGallery
//
//  Created by Venkatesh on 16/06/18.
//  Copyright © 2018 Venkatesh. All rights reserved.
//

import UIKit
import Alamofire
import AASquaresLoading

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var albums : [Album]? {
        didSet {
            self.imageCollectionView.reloadData()
        }
    }
    
    lazy var loadingSquare : AASquaresLoading = {
        let loader = AASquaresLoading(target: self.view, size: 40)
        loader.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        loader.color = UIColor.white
        return loader
    }()
    
    // MARK: - Viewcontroller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        // Start loading
        self.loadingSquare.start()
        callImgurAPI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - API calls and parsing methods
    
    fileprivate func callImgurAPI() {
        APIManager.fetchAPI { [weak self] (data, error) in
            if let data = data {
                self?.parseData(data)
            }
            if let error = error {
                self?.loadingSquare.stop()
                print(error.localizedDescription)
            }
        }
    }
    
    func parseData(_ data : Data) {
        if let apiData = APIDataModel.loadAlbumModel(data: data) {
            self.populateDataSource(apiData)
            self.loadingSquare.stop()
        }
    }
    
    func populateDataSource(_ apiData : APIData) {
        self.albums = apiData.data
    }
    
    // MARK: - UICollectionView Delegates and Datasource
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/2.5
        let yourHeight = yourWidth
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagecell", for: indexPath) as! ImageCollectionViewCell
        //cell.imageView.image =
        return cell
    }
}
