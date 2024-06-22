//
//  ViewController.swift
//  DatePicker1
//
//  Created by Sm Y on 6/22/24.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)// 타이머가 구동되면 실행할 함수 저장
    let interval = 1.0 // 타이머의 간격
    var count = 0 //타이머 초깃값
    @IBOutlet var lblCurrentTime: UILabel!
    
    @IBOutlet var lblPciekrTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)//timeInterval: 타이머 간격, target: 동작될 View, selector: 타이머가 구동될 떄 실행할 함수, userinfo: 사용자정보, repeats: 반복여부
        
    }

    @IBAction func changeDatePicker1(_ sender: UIDatePicker) {
        let datePickerView = sender //'changeDatePicker' 가 호출 되면서 sender라는 UIDatePicker 자료형의 인수가 전달됨. sender를 통해 datePickerView라는 상수에 저장함.
        let formatter = DateFormatter() // DateFormatter라는 클래스 상수 formatter를 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" //formatter의 dateFormat 속성을 설정
        lblPciekrTime.text = "선택시간:" + formatter.string(from: datePickerView.date) // 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환. "선택시간:" 이라는 문자열을 포함하여 date 값을 추가후 lblPickerTIme의 Text에 넣음
    }
    
    @objc func updateTime(){ // swift4에서는 #selector()의 인자로 사용될 메서드를 선언할때 Objective-C와의 호환성을 위하여 함수 앞에 반드시 @objc 키워드를 붙어야함.
       // lblCurrentTime.text = String(count) //String으로 변환한 count값을 lblCurrentTime레이블의 text 속성에 저장함
        // count += 1 //count 값을 1증가
        
        let date = NSDate() //현재시간을 NSDate함수를 이용해여 가져옴
        
        let formatter = DateFormatter() //날짜를 출력하기 위하여 DateFormatter라는 클래스의 상수 formatter를 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" //dateFormat 속성을 설정
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date) //앞과 동일
    }
    
}

