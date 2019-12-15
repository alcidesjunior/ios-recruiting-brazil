//
//  Details.swift
//  iCinetop
//
//  Created by Alcides Junior on 14/12/19.
//  Copyright © 2019 Alcides Junior. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DetailsView: UIView {
    
    lazy var activityIndicator:UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.bounces = true
        view.isScrollEnabled = true
        return view
    }()
    
    var imageCover = UIImage()
    
    lazy var imageCoverView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = imageCover
        return view
    }()
    
    lazy var movieTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 30)
        return view
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 15)
        view.text = "Release date:"
        return view
    }()
    
    lazy var releaseDateTextLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 15)
        return view
    }()
    
    lazy var genresLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 15)
        view.text = "Genres:"
        return view
    }()
    
    lazy var genreTextLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 15)
        return view
    }()
    
    lazy var overviewLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Overview"
        view.font = UIFont.boldSystemFont(ofSize: 15)
        return view
    }()
    
    lazy var overviewTextLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 15)
        return view
    }()
    
    override func layoutSubviews() {
        self.imageCoverView.layer.cornerRadius = 8
        self.overviewTextLabel.numberOfLines = 0
        
    }
    //chamar o setupView no init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsView: CodeView{
    func buildViewHierarchy() {
        self.addSubview(scrollView)
        self.scrollView.addSubview(imageCoverView)
        self.scrollView.addSubview(movieTitle)
        self.scrollView.addSubview(releaseDateLabel)
        self.scrollView.addSubview(releaseDateTextLabel)
        self.scrollView.addSubview(genresLabel)
        self.scrollView.addSubview(genreTextLabel)
        self.scrollView.addSubview(overviewLabel)
        self.scrollView.addSubview(overviewTextLabel)
        self.addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        
        activityIndicator.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        imageCoverView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(8)
        }
        
        movieTitle.snp.makeConstraints { (make) in
            make.top.equalTo(imageCoverView.snp.bottom).inset(8)
            make.centerY.equalToSuperview()
        }
        
        releaseDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(movieTitle.snp.bottom).inset(8)
            make.left.equalToSuperview().offset(8)
        }
        
        releaseDateTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(releaseDateLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(8)
        }
        
        genresLabel.snp.makeConstraints { (make) in
            make.top.equalTo(movieTitle.snp.bottom).inset(8)
            make.centerY.equalTo(releaseDateLabel.snp.centerY)
            make.height.equalTo(20)
        }
        
        genresLabel.snp.makeConstraints { (make) in
            make.top.equalTo(genresLabel.snp.bottom).inset(8)
            make.centerY.equalTo(releaseDateTextLabel.snp.centerY)
            make.height.equalTo(20)
        }
        
        overviewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(releaseDateTextLabel).offset(8)
            make.left.right.equalToSuperview().offset(8)
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
