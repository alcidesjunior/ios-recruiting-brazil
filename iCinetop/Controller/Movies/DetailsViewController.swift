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
    }
    
    override func viewDidLayoutSubviews() {
        mountDetails()
    }
    
    func mountDetails(){
        guard let imageUrl = URL(string: "\(EndPoints.baseImageUrl.rawValue)\(details?.posterPath)") else{return}
        screen.imageCoverView.load(url: imageUrl)
        screen.movieTitle.text = details?.originalTitle
        screen.releaseDateTextLabel.text = details?.releaseDate
        screen.genreTextLabel.text = "Sem"//details?.genreIDS.first
        screen.overviewTextLabel.text = details?.overview
    }
    
    
}
