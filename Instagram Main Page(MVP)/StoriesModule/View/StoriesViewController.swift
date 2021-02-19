//
//  StoriesViewController.swift
//  Instagram Main Page(MVP)
//
//  Created by User on 2/18/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

class StoriesViewController: UIViewController {
    
    lazy var storiesImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        view.addSubview(storiesImageView)
        
        storiesImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        storiesImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        storiesImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        storiesImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
