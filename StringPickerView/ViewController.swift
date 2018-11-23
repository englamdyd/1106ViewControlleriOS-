//
//  ViewController.swift
//  StringPickerView
//
//  Created by 503-16 on 2018. 11. 6..
//  Copyright © 2018년 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //var select
    var selectedRow = 0
    @IBAction func click(_ sender: Any) {
        //피커뷰에서 선택된 행 번호 찾아오기
        //열번호에 해당하는 선택된 행번호를 저장
        let row = pickerView.selectedRow(inComponent: 0)
        let subRow = pickerView.selectedRow(inComponent: 1)
        print(mainData[row] + ":" + subData[row][subRow])
        
    }
    @IBOutlet weak var pickerView: UIPickerView!
    //PickerView에 출력할 데이터 배열
    var ar : [String] = [String]()
    
    //메인 데이터와 섭 데이터를 저장 할 변수 선언
    var mainData : [String] = [String]()
    var subData : [[String]] = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //배열의 데이터 추가
        ar.append("이용범")
        ar.append("이민수")
        ar.append("그레이")
        ar.append("고냥이")
        
        mainData.append("프로그래밍언어")
        mainData.append("데이터베이스")
        subData.append(["Java", "Python", "Kotlin", "Swift", "C++", "C#", "C", "JavaScript"])
        subData.append(["Oracle", "MySQL", "MSSQL", "SQLite", "Access"])
        
        
        
        //pickerView의 delegate 와 dataSource 설정
        pickerView.delegate = self
        pickerView.dataSource = self
    }

}

//Pickerview 출력을 위한 extension
extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    //열의 개수를 설정하는 메소드
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 2
    }
    //열별로 행의 개수를 설정하는 메소드
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if component == 0{
            return mainData.count
        }
        else{
            return subData[selectedRow].count
        }
    }
    
    //PickerView에 출력할 문자열을 설정하는 메소드
    //return 하는 문자열이 피커뷰에 출력
    //row가 행 번호이고 component가 열번호
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        //배열에서 행 번호에 해당하는 데이터 리턴
        if component == 0{
            return mainData[row]
        }
        else{
            return subData[selectedRow][row]
        }
    }
    //피커 뷰의 선택이 변경되었을 때 호출되는 메소드
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        //첫번째 열의 선택이 변경되었을 때
        if component == 0{
            //선택된 행 번호를 selectedRow 에 대입
            selectedRow = pickerView.selectedRow(inComponent: 0)
            //피커 뷰의 두번째 열의 데이터를 다시 출력
            pickerView.reloadComponent(1)
        }
    }

}






