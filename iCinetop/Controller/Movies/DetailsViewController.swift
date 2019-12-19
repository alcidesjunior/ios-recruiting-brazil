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
    var details: MovieDetail?
    var movieID: Int = 0
    let movieModel = MovieModel()
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupingView()
        self.requestMovie()
    }
    
    private func setupingView(){
        self.title = "Details"
        self.view.backgroundColor = UIColor(named: "whiteCustom")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "1dblackCustom")
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "whiteCustom")!]
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "star"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButton
        self.navigationController!.navigationBar.tintColor = UIColor(named: "redCustom")
    }
    
    private func requestMovie(){
        self.movieModel.show(id: self.movieID){(result) in
            switch result{
                case .success(let movie):
                    DispatchQueue.main.async {
                        self.details = movie
                        self.mountDetails()
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error)
                    }
            }
        }
    }
    
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
        var stringGenres = ""
        if let genres = details?.genres{
            var gCount = 0
            for genre in genres{
                if gCount < genres.count{
                    if gCount == 0{
                        stringGenres = "\(genre.name) "
                    }else{
                        stringGenres = "\(stringGenres), \(genre.name) "
                    }
                }
                gCount += 1
            }

        }
        self.screen.movieTitle.text = self.details?.originalTitle
        self.screen.releaseDateTextLabel.text = self.details?.releaseDate.replacingOccurrences(of: "-", with: "/")
        self.screen.genreTextLabel.text = stringGenres
        self.screen.overviewTextLabel.text = details?.overview
    }
    
    
}
