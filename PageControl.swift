//
//  ViewController.swift
//  PageControl
//
//  Created by Sm Y on 6/29/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count //페이지 컨드롤의 전체 페이지 수를 의미함.
        pageControl.currentPage = 0 //현재 페이지를 의미함
        pageControl.pageIndicatorTintColor = UIColor.green //페이지 컨트롤의 페이지를 표시하는 부분의 색상을 의미함. 여기서는 초록색
        pageControl.currentPageIndicatorTintColor = UIColor.red //페이지 컨트롤의 현재 페이지를 표시하는 색상을 의미함. 여기서는 빨강색
        imgView.image = UIImage(named: images[0]) //동작했을때 배열의 0번째 부분의 이미지가 출력되도록함.
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])//페이지가 변경되었을때 현재 페이지에 해당하는 이미지파일 이름을 images 배열에서 가지고 와서 imgView에 할당하여 이미지 출려
        
    }
}

        
