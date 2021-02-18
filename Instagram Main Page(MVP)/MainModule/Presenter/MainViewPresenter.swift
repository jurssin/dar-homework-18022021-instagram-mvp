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
}
protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol)
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    let provider = PostDataService()
    
    var postData: [Post] = [
        Post(image: images.first, title: "No storyboards"),
        Post(image: images.second, title: "5 soft skills for developers"),
        Post(image: images.third, title: "What's new in Xcode 11"),
        Post(image: images.fourth, title: "Patroen revamp"),
        Post(image: images.fifth, title: "How I got raise. $60 - $100"),
        Post(image: images.six, title: "Shake Gesture"),
        Post(image: images.seven, title: "2019 state of salaries"),
        Post(image: images.eight, title: "How to build your app wirelessly"),
        Post(image: images.nine, title: "Swift news 70"),
        Post(image: images.ten, title: "The 90/90 Rule")
    ]
    
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
