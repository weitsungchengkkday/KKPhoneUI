//
//  PhoneViewModel.swift
//  KKPhone
//
//  Created by KKday on 2020/11/26.
//

import Foundation

enum PhoneStatus {
    case normal
    case calling
}

final class PhoneViewModel {
    
    private(set) var status: PhoneStatus = .normal {
        didSet {
            changePhoneViewHandler()
        }
    }
    
    var currentPhoneNum: String = ""
    
    var changePhoneViewHandler: () -> Void = {}
    
    func changeStatus(status: PhoneStatus) {
        self.status = status
    }
    
    func closePhoneView() {
        PhoneManager.shared.state = .close
    }
    
    
    func hidePhoneView() {
        PhoneManager.shared.state = .hidden
    }
}
