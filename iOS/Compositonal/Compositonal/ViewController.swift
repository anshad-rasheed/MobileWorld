//
//  ViewController.swift
//  Compositonal
//
//  Created by Anshad R on 12/02/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .estimated(10))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(100))
        
        let count = floor(UIScreen.main.bounds.size.width/180)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: Int(count))
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout

    }
    
    
}


extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        if indexPath.item % 2 == 0 {
            cell.titleLabel.text = "TestsmnjfhhjshhhshfhhfsfsffsTestsmnjfhhjshhhshfhhfsfsffsTestsmnjfhhjshhhshfhhfsfsffsTestsmnjfhhjshhhshfhhfsfsffsTestsmnjfhhjshhhshfhhfsfsffsTestsmnjfhhjshhhshfhhfsfsffsTestsmnjfhhjshhhshfhhfsfsffs"

        } else {
            cell.titleLabel.text = "TestsmnTestsmnjfhhjshhhshfhhfsfsffs"

        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}


class CustomCell: UICollectionViewCell {
      static let reuseIdentifier = "CustomCell"
    let titleLabel: UILabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure()  {
        titleLabel.numberOfLines = 0
//        contentView.backgroundColor = .green
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        
    }
}


class GridCollectionLayout: UICollectionViewLayout {
    
    
    override init() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
