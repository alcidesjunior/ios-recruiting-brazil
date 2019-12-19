//
//  DetailsViewController.swift
//  iCinetop
//
//  Created by Alcides Junior on 14/12/19.
//  Copyright © 2019 Alcides Junior. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    let screen = DetailsView()
    var details: Results?
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        self.view.backgroundColor = UIColor(named: "whiteCustom")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "1dblackCustom")
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "whiteCustom")!]
        self.mountDetails()    }
    
    private func mountDetails(){
        if details?.posterPath != ""{
            guard let posterUrl = details?.posterPath else{return}
            screen.activityIndicatorToImage.startAnimating()
            guard let imageUrl = URL(string: "\(EndPoints.baseImageUrl.rawValue)\(posterUrl)") else{return}
            self.screen.imageCoverView.load(url: imageUrl){(e) in
                self.screen.activityIndicatorToImage.stopAnimating()
            }
        }else{
            self.screen.imageCoverView.image = UIImage(named: "default")
        }

        self.screen.movieTitle.text = self.details?.originalTitle
        self.screen.releaseDateTextLabel.text = self.details?.releaseDate
        self.screen.genreTextLabel.text = "Sem"//details?.genreIDS.first
        self.screen.overviewTextLabel.text = details?.overview
    }
    
    
}
