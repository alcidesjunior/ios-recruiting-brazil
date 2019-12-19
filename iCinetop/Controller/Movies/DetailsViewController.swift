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
//        mountDetails()
        print("loadView")
    }
    
    override func viewDidAppear(_ animated: Bool) {
            self.mountDetails()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        self.view.backgroundColor = UIColor(named: "whiteCustom")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "1dblackCustom")
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "whiteCustom")!]
        print("viewDidLoad")
        print(details)
    }
    
    private func mountDetails(){
        guard let imageUrl = URL(string: "\(EndPoints.baseImageUrl.rawValue)\(details?.posterPath)") else{return}
        self.screen.imageCoverView.load(url: imageUrl)
        self.screen.movieTitle.text = self.details?.originalTitle
        self.screen.releaseDateTextLabel.text = self.details?.releaseDate
        self.screen.genreTextLabel.text = "Sem"//details?.genreIDS.first
        self.screen.overviewTextLabel.text = details?.overview
    }
    
    
}
