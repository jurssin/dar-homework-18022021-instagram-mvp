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
    //var postData =

    let view: MainViewProtocol
    
    required init(view: MainViewProtocol) {
        self.view = view
    }

}
