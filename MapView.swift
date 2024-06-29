//
//  ViewController.swift
//  Map
//
//  Created by Sm Y on 6/28/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = "" //위치정보를 표시할 레이블에는 아직 특별히 표시할 필요가 업으므로 공백으로 둠.
        lblLocationInfo2.text = "" //위치정보를 표시할 레이블에는 아직 특별히 표시할 필요가 업으므로 공백으로 둠.
        locationManger.delegate = self // 상수 locationManger의 델리게이트를 self로 설정
        locationManger.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고로 설정
        locationManger.requestWhenInUseAuthorization() //위치데이터를 추적하기 위해 사용자에게 승인을 구함
        locationManger.startUpdatingLocation() //위치 업데이트를 시작함
        myMap.showsUserLocation = true //위치보기값을 true로 설정
        
    }
    func goLocation(latitudeVaule: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeVaule, longitudeValue) //dnlehdhk rudeh rkqtdmf aoroqustnfh gkdu CLLocation Coordinate2DMake함수로 호출하고, 리턴값을 pLocation으로 받습니다.
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)//범위 값을 매개변수로 하여 MKCoordinateSpanMake 함수를 호출하고, 리턴 값을 spanValue로 받습니다. span은  지도의 확대 축소 수준을 결정함 MKCoordinateSpan()과 연관이있음
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)//pLocation과 spanValue값을 매개변수로 MKCoordinateRegionMake함수를 호출하고 리턴값을 pRegion으로 받습니다.
        myMap.setRegion(pRegion, animated: true) //PRegion 값을 매개변수로 하여 myMap.setRegion 함수를 호출합니다.
        return pLocation
    }
    
    func setAnnotation(latitudeVaule: CLLocationDegrees, longitudeVaule : CLLocationDegrees, delta span : Double, title strTitle:String, subtitle strSubtitle:String){
        let annotation = MKPointAnnotation() //MKPointAnnotation은 MapKit 프레임워크의 일부로 지도위에 특정지점을 나타내는데 사용됩니다.
        annotation.coordinate = goLocation(latitudeVaule: latitudeVaule, longitudeValue: longitudeVaule, delta: span) //.coordinate MKPointAnnotation의 속성중 하나로 CLLocationCoordinate2D 타입으로 위도와 경도를 사용하여 위치를 지정합니다. span은
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last //위치가 업데이트되면 먼저 마지막 위치 값을 찾아냅니다.
        _=goLocation(latitudeVaule: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)//마지막 위치의 위도와 경도 값을 가지고 앞에서 만든 goLocation 함수를 호출합니다. 이때 delta 값은 지도의 크기를 정하는데, 값이 작을수록 확대되는 효과가 있다.
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: { //CLGeocoder()클래스는 지리적좌표를 사람친화적인 주소로 변환하거나 주소를 지리적좌표로 변환하는데 사용됨. reverseGeocodeLocation 메서드를 통해 특정위치의 주소를 가져올 수 있음. completionHandler는 클로저
            (placemarks,error) -> Void in
            let pm = placemarks!.first //역지오코딩 작업의 결과로 변환된 주소정보들을 담고있다 타입은 [CLPlacemark]이다., !는 옵셔널강제언래핑으로 값이 nil이 아니라고 확신할때 쓴다., first는 배열의 첫번째요소를 반환할떄 쓴다.
            let country = pm!.country  // 장소의 국가를 나타내주는 문자열속성 옵셔널타입인 String?이다.
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManger.stopUpdatingLocation()
    }
    

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManger.startUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeVaule: 37.486734, longitudeVaule: 126.801786, delta: 0.01, title: "가톨릭대학교", subtitle: "경기도 부천시 원미구 지봉로 43")
            self.lblLocationInfo1.text = "보고계신 위치"
            self.lblLocationInfo2.text = "가톨릭대학교 성심교정"
        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitudeVaule: 37.510745, longitudeVaule: 126.887551, delta: 0.01, title: "우리집", subtitle: "서울특별시 경인로 65길 16-15")
            self.lblLocationInfo1.text = "보고계신 위치"
            self.lblLocationInfo2.text = "우리집"
        }
    }
    
}

