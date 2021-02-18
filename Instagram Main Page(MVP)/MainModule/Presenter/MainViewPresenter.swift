//
//  MainViewPresenter.swift
//  Instagram Main Page(MVP)
//
//  Created by User on 2/18/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import Foundation

protocol MainViewProtocol {
    func setPosts(postData: [Post])
    func setStories(storiesData: [Stories])
    func updateLikes(postDataWithLike: [Post])
}
protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol)
    func getLikes(tag: Int)
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    func getLikes(tag: Int) {
        postData[tag].isLiked = !postData[tag].isLiked
        postData[tag].numberOfLikes = postData[tag].numberOfLikes + 1
    }
        
    var postData: [Post] = [
        Post(image: images.first, title: "No storyboards", isLiked: false, numberOfLikes: 0),
        Post(image: images.second, title: "5 soft skills for developers", isLiked: false, numberOfLikes: 0),
        Post(image: images.third, title: "What's new in Xcode 11", isLiked: false, numberOfLikes: 0),
        Post(image: images.fourth, title: "Patroen revamp", isLiked: false, numberOfLikes: 0),
        Post(image: images.fifth, title: "How I got raise. $60 - $100", isLiked: false, numberOfLikes: 0),
        Post(image: images.six, title: "Shake Gesture", isLiked: false, numberOfLikes: 0),
        Post(image: images.seven, title: "2019 state of salaries", isLiked: false, numberOfLikes: 0),
        Post(image: images.eight, title: "How to build your app wirelessly", isLiked: false, numberOfLikes: 0),
        Post(image: images.nine, title: "Swift news 70", isLiked: false, numberOfLikes: 0),
        Post(image: images.ten, title: "The 90/90 Rule", isLiked: false, numberOfLikes: 0)
        ]{
        didSet {
            view.updateLikes(postDataWithLike: self.postData)
        }
    }
    
    var storiesData: [Stories] = [
        Stories(name: "juliet", image: "avatar1"),
        Stories(name: "fred", image: "avatar2"),
        Stories(name: "carl", image: "avatar3"),
        Stories(name: "ashlie", image: "avatar4"),
        Stories(name: "sam", image: "avatar5"),
        Stories(name: "tony", image: "avatar6"),
        Stories(name: "zara", image: "avatar7"),
        Stories(name: "ray", image: "avatar8"),
        Stories(name: "ben", image: "avatar9"),
        Stories(name: "steve", image: "avatar10")
    ]

    let view: MainViewProtocol
    
    required init(view: MainViewProtocol) {
        self.view = view
        view.setPosts(postData: postData)
        view.setStories(storiesData: storiesData)
    }

}
