//
//  MoviesViewController.swift
//  iCinetop
//
//  Created by Alcides Junior on 14/12/19.
//  Copyright © 2019 Alcides Junior. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    let screen = MovieView()
    var movies: [Results] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        self.view = screen
        self.view.backgroundColor = UIColor(named: "whiteCustom")
        self.screen.collectionView.delegate = self
        self.screen.collectionView.dataSource = self
        self.screen.collectionView.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "1dblackCustom")
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "whiteCustom")!]
        self.navigationController?.navigationBar.isTranslucent = false
        seedMovies()
    }
    
    func seedMovies(){
        let movieModel = MovieModel()
        screen.activityIndicator.startAnimating()
        movieModel.getAll{(result) in
            
            switch result{
            case .success(let movieResult):
                DispatchQueue.main.async {
                    self.screen.activityIndicator.stopAnimating()
                    for item in movieResult.results{
                        self.movies.append(item)
                    }
                    self.screen.collectionView.reloadData()
//                    print(self.movies)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.screen.activityIndicator.stopAnimating()
                    print(error)
                }
            }
        }
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        cell.movieTitle.text = self.movies[indexPath.item].originalTitle
        cell.activityIndicatorToImage.startAnimating()
        guard let imageUrl = URL(string: "\(EndPoints.baseImageUrl.rawValue)\(self.movies[indexPath.item].posterPath)") else{return cell}
        DispatchQueue.main.async {
            cell.movieImageView.load(url: imageUrl){(e) in
                cell.activityIndicatorToImage.stopAnimating()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        
        return CGSize(width: width/2.14, height: width/1.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsController = DetailsViewController()
        detailsController.details = self.movies[indexPath.item]
        self.navigationController?.pushViewController(detailsController, animated: true)
    }
    
    
}

