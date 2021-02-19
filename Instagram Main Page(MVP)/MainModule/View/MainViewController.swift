//
//  MainViewController.swift
//  Instagram Main Page(MVP)
//
//  Created by User on 2/18/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
        
        var storiesData: [Stories] = []
        var postData: [Post] = []
        
        lazy var postTableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .grouped)
            tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.rowHeight = 460
            tableView.allowsSelection = false
            tableView.dataSource = self
            tableView.delegate = self
            return tableView
        }()
        
        lazy var storiesCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            layout.itemSize = CGSize(width: 65, height: 65)
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .white
            collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            
            return collectionView
        }()
    
        var presenter: MainViewPresenterProtocol!

        override func viewDidLoad() {
            super.viewDidLoad()
            self.presenter = MainViewPresenter(view: self)
            setupUI()
        }
    }

    extension MainViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return storiesCollectionView
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            100
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return postData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = postTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
          
            let post = postData[indexPath.row]
            let images = storiesData[indexPath.row].image
            let names = storiesData[indexPath.row].name
            cell.likeButton.tag = indexPath.row

            cell.likeButton.addTarget(self, action: #selector(handleLikes(sender:)), for: .touchUpInside)
            cell.likeButton.setBackgroundImage(UIImage(named: "like"), for: .normal)
            
            if postData[indexPath.row].isLiked {
                cell.likeButton.setBackgroundImage(UIImage(named: "liked"), for: .normal)
            }
            cell.setData(post: post, userImage: images, userName: names)
            cell.numberOfLikesLabel.text = "\(postData[indexPath.row].numberOfLikes) Likes"
            return cell
        }
        @objc func handleLikes(sender: UIButton) {
            presenter.getLikes(tag: sender.tag)
        }
        
    }
    extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return storiesData.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as! StoriesCollectionViewCell
            cell.setDataToCells(imageName: storiesData[indexPath.row].image, userName: storiesData[indexPath.row].name)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc = StoriesViewController()
            vc.storiesImageView.image = postData[indexPath.row].image
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                vc.dismiss(animated: true, completion: nil)
            }
        }
    }

    extension MainViewController {
        private func setupUI() {
            navBarSetup()
            tabBarSetup()
            self.view.backgroundColor = .white
            view.addSubview(postTableView)
            NSLayoutConstraint.activate([
                postTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                postTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
            ])
        }
        
        private func tabBarSetup() {
            tabBarController?.tabBar.tintColor = .black

            tabBarController?.tabBar.items?[0].image = UIImage(systemName: "house")
            tabBarController?.tabBar.items?[1].image = UIImage(systemName: "magnifyingglass")
            tabBarController?.tabBar.items?[2].image = UIImage(systemName: "plus.app")
            tabBarController?.tabBar.items?[3].image = UIImage(systemName: "bag")
            tabBarController?.tabBar.items?[4].image = UIImage(systemName: "person.circle")
        }
        
        private func navBarSetup() {
            let logoButton = UIButton(type: .system)
            let directLogo = UIButton(type: .system)
            let notificationButton = UIButton(type: .system)
            
            navigationController?.navigationBar.addSubview(logoButton)
            navigationController?.navigationBar.addSubview(directLogo)
            navigationController?.navigationBar.addSubview(notificationButton)
            
            
            logoButton.setBackgroundImage(UIImage(named: "instagram logo-1"), for: .normal)
            logoButton.imageView?.contentMode = .scaleAspectFit
            
            directLogo.setBackgroundImage(UIImage(named: "direct"), for: .normal)
            directLogo.imageView?.contentMode = .scaleAspectFit
            
            notificationButton.setBackgroundImage(UIImage(named: "like"), for: .normal)
            notificationButton.imageView?.contentMode = .scaleAspectFit
            
            directLogo.translatesAutoresizingMaskIntoConstraints = false
            logoButton.translatesAutoresizingMaskIntoConstraints = false
            notificationButton.translatesAutoresizingMaskIntoConstraints = false
            
            logoButton.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!, constant: 5).isActive = true
            logoButton.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!, constant: 2).isActive = true
            logoButton.bottomAnchor.constraint(equalTo: (navigationController?.navigationBar.bottomAnchor)!, constant: -2).isActive = true
            logoButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
            
            directLogo.heightAnchor.constraint(equalToConstant: 25).isActive = true
            directLogo.widthAnchor.constraint(equalToConstant: 25).isActive = true
            directLogo.centerYAnchor.constraint(equalTo: logoButton.centerYAnchor).isActive = true
            directLogo.trailingAnchor.constraint(equalTo: (navigationController?.navigationBar.trailingAnchor)!, constant: -15).isActive = true
            
            notificationButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
            notificationButton.centerYAnchor.constraint(equalTo: logoButton.centerYAnchor).isActive = true
            notificationButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
            notificationButton.trailingAnchor.constraint(equalTo: directLogo.leadingAnchor, constant: -20).isActive = true
        }
    }
    
extension MainViewController: MainViewProtocol {
    func updateLikes(postDataWithLike: [Post]) {
        self.postData = postDataWithLike
        postTableView.reloadData()
    }
    
    func setPosts(postData: [Post]) {
        self.postData = postData
    }
    
    func setStories(storiesData: [Stories]) {
        self.storiesData = storiesData
    }
    
    
}
