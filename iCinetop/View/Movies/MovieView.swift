//
//  Movie.swift
//  iCinetop
//
//  Created by Alcides Junior on 14/12/19.
//  Copyright © 2019 Alcides Junior. All rights reserved.
//

import UIKit
import SnapKit

final class MovieView: UIView {
    lazy var safeArea = self.layoutMarginsGuide
    
    lazy var activityIndicator:UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 8, right: 8)
        return view
    }()
    
    func registerCells(){
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieView: CodeView{
    func buildViewHierarchy() {
        self.addSubview(self.collectionView)
        self.addSubview(self.activityIndicator)
    }
    
    func setupConstraints() {
        
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(safeArea.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.activityIndicator.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        registerCells()
    }
    
    
}
