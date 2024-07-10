//
//  ViewController.swift
//  RockSissorPaper
//
//  Created by Sm Y on 7/8/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgComputerChoice: UIImageView!
    @IBOutlet weak var imgMyChoice: UIImageView!
    @IBOutlet weak var lblComputerChice: UILabel!
    @IBOutlet weak var lblMyChoice: UILabel!
    var rspArray = [#imageLiteral(resourceName: "ready"), #imageLiteral(resourceName: "rock"), #imageLiteral(resourceName: "scissors"), #imageLiteral(resourceName: "paper")]
    override func viewDidLoad() {
        super.viewDidLoad()
        imgMyChoice.image = rspArray[0]
        imgComputerChoice.image = rspArray[0]
        lblComputerChice.text = "준비"
        lblMyChoice.text = "준비"
        
        
    }

    @IBAction func btnSissor(_ sender: UIButton) {
        imgMyChoice.image = rspArray[2]
        imgComputerChoice.image = rspArray[0]
        lblMyChoice.text = "가위"
        lblTitle.text = "선택하세요."
        lblComputerChice.text = "준비"
    
    }
    
    @IBAction func btnRock(_ sender: UIButton) {
        imgMyChoice.image = rspArray[1]
        lblMyChoice.text = "바위"
        imgComputerChoice.image = rspArray[0]
        lblComputerChice.text = "준비"
        lblTitle.text = "선택하세요."
    }
    
    @IBAction func btnPaper(_ sender: UIButton) {
        imgMyChoice.image = rspArray[3]
        lblMyChoice.text = "보"
        imgComputerChoice.image = rspArray[0]
        lblTitle.text = "선택하세요."
        lblComputerChice.text = "준비"
    }
    @IBAction func btnReset(_ sender: UIButton) {
        imgMyChoice.image = rspArray[0]
        imgComputerChoice.image = rspArray[0]
        lblMyChoice.text = "준비"
        lblComputerChice.text = "준비"
    }
    
    @IBAction func btnSelect(_ sender: UIButton) {
        imgComputerChoice.image = rspArray[1...3].randomElement()
        if (imgMyChoice.image == imgComputerChoice.image){
            lblComputerChice.text = lblMyChoice.text
            lblTitle.text = "비겼습니다!"
        }
        else if(imgComputerChoice.image == rspArray[1]){
            lblComputerChice.text = "바위"
            if(imgMyChoice.image == rspArray[2]){
                lblTitle.text = "졌습니다!"
            }
            else if(imgMyChoice.image == rspArray[3]){
                lblTitle.text = "이겼습니다!"
            }
        }
        else if(imgComputerChoice.image == rspArray[2]){
            lblComputerChice.text = "가위"
            if(imgMyChoice.image == rspArray[1]){
                lblTitle.text = "이겼습니다!"
            }
            else{
                lblTitle.text = "졌습니다!"
            }
        }
        else if(imgComputerChoice.image == rspArray[3]){
            lblComputerChice.text = "보"
            if(imgMyChoice.image == rspArray[2]){
                lblTitle.text = "이겼습니다!"
            }
            else{
                lblTitle.text = "졌습니다!"
            }
        }
    }
}

