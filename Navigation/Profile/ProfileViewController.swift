//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Евгений Кряквин on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage

class ProfileViewController: UIViewController {
    private let profileTableView = UITableView(frame: .zero, style: .grouped)
    private let postTableId = "PostTableViewCell"
   
    
    
   

    
   
   //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableViewConstraints()
        setupProfileTableView()
       
}
    
    
    //MARK: - Table Setup
    private func setupProfileTableView() {
        
       
        profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: postTableId)
        profileTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        profileTableView.dataSource = self
        profileTableView.delegate = self
    }
    
   
    //MARK: - Table Constraints
    private func setupTableViewConstraints() {
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileTableView)

        let constraints = [
            profileTableView.topAnchor.constraint(equalTo:view.topAnchor ),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ]
        NSLayoutConstraint.activate(constraints)
    }
}


//MARK: - Table Data Source
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Storage.postTableModel.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.postTableModel[section].posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self)) as! PhotosTableViewCell
            return cell
        } else {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: postTableId, for: indexPath) as! PostTableViewCell
        let post = Storage.postTableModel[indexPath.section].posts[indexPath.row]
        cell.post = post
        return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
            return UITableView.automaticDimension
}
 
}

//MARK: - Table Delegate
extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        
            navigationController?.pushViewController(PhotoCollectionViewController(), animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

