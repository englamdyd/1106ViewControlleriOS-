//
//  ViewController.swift
//  TapGesture
//
//  Created by 503-16 on 2018. 11. 6..
//  Copyright © 2018년 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //탭 동작이 발생했을 때 수행할 메소드
    @objc func tapMethod(sender:UITapGestureRecognizer){
        print("더블클릭")
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapMethod(sender:)))
            //제약조건 설정
            tapGesture.numberOfTapsRequired = 2
            //뷰와 제스쳐 연결
            imageView.addGestureRecognizer(tapGesture)
    }

}
