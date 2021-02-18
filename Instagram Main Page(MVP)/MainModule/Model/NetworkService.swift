//
//  NetworkService.swift
//  Instagram Main Page(MVP)
//
//  Created by User on 2/18/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import Foundation

class PostDataService {
    func getPosts(_ callBack: @escaping ([Post]) -> Void) {

        let postData: [Post] = [
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
        //use delay to simulate network request
        let delayTime = DispatchTime.now() + .seconds(3)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            callBack(postData)
        }
        
    }
}
