//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Евгений Кряквин on 24.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var post: PostPage? {
        didSet{
            postImageView.image = UIImage(named: post?.image ?? "noImage")
            postDescription.text = post?.description
            postAuthor.text = post?.author
            postLikes.text = "Likes: \(post?.likes ?? 0)"
            postViews.text = "Views: \(post?.views ?? 0)"
            
        }
    }
    //MARK: - Create views
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        return postDescription
    }()
    
    private let postAuthor: UILabel = {
        let postAuthor = UILabel()
        postAuthor.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postAuthor.textColor = .black
        postAuthor.numberOfLines = 2
        postAuthor.textAlignment = .left
        postAuthor.translatesAutoresizingMaskIntoConstraints = false
        return postAuthor
    }()
    
    private let postLikes: UILabel = {
        let postLikes = UILabel()
        postLikes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postLikes.textColor = .black
        postLikes.translatesAutoresizingMaskIntoConstraints = false
        return postLikes
    }()
    
    private let postViews: UILabel = {
        let postViews = UILabel()
        postViews.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postViews.textColor = .black
        postViews.translatesAutoresizingMaskIntoConstraints = false
        return postViews
    }()
    
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupPostViews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPostViews()
    }
    
    //MARK: - Layout
    private func setupPostViews() {
        contentView.addSubview(postImageView)
        contentView.addSubview(postDescription)
        contentView.addSubview(postAuthor)
        contentView.addSubview(postLikes)
        contentView.addSubview(postViews)
        
        let postConstraints = [
            //MARK: - Post Author
            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            //MARK: - Post Image
            postImageView.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            //MARK: - Post Description
            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            //MARK: - Post Likes
            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            //MARK: - Post Views
            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            
            
            
            
            
            
        ]
        NSLayoutConstraint.activate(postConstraints)
    }
}
