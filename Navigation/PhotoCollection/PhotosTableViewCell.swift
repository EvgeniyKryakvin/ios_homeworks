//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Евгений Кряквин on 23.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let arrowImage: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(systemName: "arrow.right")
        arrow.tintColor = .black
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.text = "Photos"
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private static func createStackImage(image: String) -> UIImageView {
        let stackImage = UIImageView()
        stackImage.image = UIImage(named: image)
        stackImage.clipsToBounds = true
        stackImage.layer.cornerRadius = 6
        stackImage.contentMode = .scaleAspectFill
        return stackImage
    }
    
    private let photoStackView: UIStackView = {
        let photoStackView = UIStackView()
        let firstImage = createStackImage(image: "BMW")
        let secondImage = createStackImage(image: "Cross")
        let thirdImage = createStackImage(image: "Honda")
        let fourthImage = createStackImage(image: "Voge300ac")
        
//        let firstImage: UIImageView = {
//            let firstImage = UIImageView()
//            firstImage.image = UIImage(named: "BMW")
//            firstImage.clipsToBounds = true
//            firstImage.layer.cornerRadius = 6
//            firstImage.contentMode = .scaleAspectFill
//            return firstImage
//        }()
//
//        let secondImage: UIImageView = {
//            let secondImage = UIImageView()
//            secondImage.image = UIImage(named: "Cross")
//            secondImage.clipsToBounds = true
//            secondImage.layer.cornerRadius = 6
//            secondImage.contentMode = .scaleAspectFill
//            return secondImage
//        }()
//
//        let thirdImage: UIImageView = {
//            let thirdImage = UIImageView()
//            thirdImage.image = UIImage(named: "Honda")
//            thirdImage.clipsToBounds = true
//            thirdImage.layer.cornerRadius = 6
//            thirdImage.contentMode = .scaleAspectFill
//            return thirdImage
//        }()
//
//        let fourthImage: UIImageView = {
//            let fourthImage = UIImageView()
//            fourthImage.image = UIImage(named: "Voge300ac")
//            fourthImage.clipsToBounds = true
//            fourthImage.layer.cornerRadius = 6
//            fourthImage.contentMode = .scaleAspectFill
//            return fourthImage
//        }()
        
        photoStackView.distribution = .fillEqually
        photoStackView.spacing = 8
        photoStackView.addArrangedSubview(firstImage)
        photoStackView.addArrangedSubview(secondImage)
        photoStackView.addArrangedSubview(thirdImage)
        photoStackView.addArrangedSubview(fourthImage)
        photoStackView.translatesAutoresizingMaskIntoConstraints = false

        return photoStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupPhotoViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPhotoViews()
    }
    
    private func setupPhotoViews() {
        contentView.addSubview(title)
        contentView.addSubview(photoStackView)
        contentView.addSubview(arrowImage)
        
        let constraints = [
            arrowImage.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            
            photoStackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            photoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoStackView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
