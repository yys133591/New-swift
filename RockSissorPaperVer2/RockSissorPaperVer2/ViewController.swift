//
//  ViewController.swift
//  RockSissorPaperVer2
//
//  Created by Sm Y on 7/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    //변수  /속성
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgComputer: UIImageView!
    @IBOutlet weak var imgMy: UIImageView!
    @IBOutlet weak var lblMy: UILabel!
    @IBOutlet weak var lblComputer: UILabel!
    
    //데이터 저장을 위한 변수
    var myChoice = Rsp(rawValue: Int.random(in: 0...2))
    var comChoice = Rsp(rawValue: Int.random(in: 0...2))
    
    //앱에 화면에 처음들어오면 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        imgComputer.image = #imageLiteral(resourceName: "ready")
        imgMy.image = #imageLiteral(resourceName: "ready")
        lblMy.text = "준비"
        lblComputer.text = "준비"
        
    }
    
    //enum을 선택해서 그 정보를 저장하는 함수
    @IBAction func btnRsp(_ sender: UIButton) {
        let select = sender.currentTitle
        
        switch select {
        case "가위":
            myChoice = Rsp(rawValue: 2)
        case "바위":
            myChoice = Rsp(rawValue: 0)
        case "보":
            myChoice = Rsp(rawValue: 1)
        default:
            break
        }
    }
    
    //Swith문을 활용해서
    @IBAction func btnSelected(_ sender: UIButton) {
        switch comChoice {
        case .rock:
            imgComputer.image = #imageLiteral(resourceName: "rock")
            lblComputer.text = "바위"
        case .paper:
            imgComputer.image = #imageLiteral(resourceName: "paper")
            lblComputer.text = "보"
        case .scissors:
            imgComputer.image = #imageLiteral(resourceName: "scissors")
            lblComputer.text = "가위"
        default:
            break
 
        }
        
        
        switch myChoice {
        case .rock:
            imgMy.image = #imageLiteral(resourceName: "rock")
            lblMy.text = "바위"
        case .paper:
            imgMy.image = #imageLiteral(resourceName: "paper")
            lblMy.text = "보"
        case .scissors:
            imgMy.image = #imageLiteral(resourceName: "scissors")
            lblMy.text = "가위"
        default:
            break
 
        }
        
        if myChoice == comChoice{
            lblTitle.text = "비겼습니다."
        }else if myChoice == .rock && comChoice == .scissors{
            lblTitle.text = "이겼습니다."
        }else if myChoice == .scissors && comChoice == .paper{
            lblTitle.text = "이겼습니다."
        }else if myChoice == .paper && comChoice == .rock{
            lblTitle.text = "이겼습니다."
        }else{
            lblTitle.text = "졌습니다."
        }
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        imgComputer.image = #imageLiteral(resourceName: "ready")
        imgMy.image = #imageLiteral(resourceName: "ready")
        lblMy.text = "준비"
        lblComputer.text = "준비"
        comChoice = Rsp(rawValue: Int.random(in: 0...2))
    }
    
}

