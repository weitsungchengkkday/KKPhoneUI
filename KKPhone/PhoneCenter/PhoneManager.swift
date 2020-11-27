//
//  PhoneManager.swift
//  KKPhone
//
//  Created by KKday on 2020/11/26.
//

import Foundation
import UIKit

enum PhoneState {
    case open
    case close
    case hidden
}

protocol PhoneDelegate: class {
    
    func getPhoneStatus(_ phoneManager: PhoneManager, phoneStaus status: PhoneStatus?)
}

final class PhoneManager {
    
    static let shared = PhoneManager()
    weak var delegate: PhoneDelegate?
    private var phoneVC: PhoneViewController?
    
    var state: PhoneState = .close {
        didSet {
            let currentViewController: UIViewController? = Utilities.currentViewController
            guard let topViewController = currentViewController?.tabBarController ?? currentViewController?.navigationController ??
                    currentViewController else {
                return
            }
            
            switch state {
            case .open:
                presentPhoneViewContorller(currentViewController, topViewController)
                
            case .close:
                dismissPhoneViewContorller(currentViewController, topViewController)
                
            case .hidden:
                hiddenPhoneViewContorller(currentViewController, topViewController)
            }
        }
    }
    
    private func presentPhoneViewContorller(_ currentViewController: UIViewController?, _ topViewController: UIViewController) {
        
        DispatchQueue.main.async {
            
            if PhoneManager.shared.phoneVC != nil  {
               
                // If phoneVC not dismiss (i.e hidden) , addSubview on topViewController again
                PhoneManager.shared.phoneVC?.view.frame = topViewController.view.bounds
                UIView.transition(with: topViewController.view, duration: 0.4, options: .transitionCrossDissolve, animations: {
                    topViewController.view.addSubview(PhoneManager.shared.phoneVC?.view ?? UIView())
                }, completion: nil)
                
                
            } else {
                PhoneManager.shared.phoneVC = PhoneViewController()
                PhoneManager.shared.phoneVC?.view.frame = topViewController.view.bounds
                
                UIView.transition(with: topViewController.view, duration: 0.4, options: .transitionCrossDissolve, animations: {
                    topViewController.view.addSubview(PhoneManager.shared.phoneVC?.view ?? UIView())
                }, completion: nil)
            }
            
        }
    }
    
    private func dismissPhoneViewContorller(_ currentViewController: UIViewController?, _ topViewController: UIViewController) {
        
        if PhoneManager.shared.phoneVC == nil {
            return
        }
        
        DispatchQueue.main.async {
            UIView.transition(with: topViewController.view, duration: 0.4, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                
                PhoneManager.shared.phoneVC?.view.removeFromSuperview()
                PhoneManager.shared.phoneVC = nil
            }, completion: nil)
        }
    }
    
    
    private func hiddenPhoneViewContorller(_ currentViewController: UIViewController?, _ topViewController: UIViewController) {
        
        if PhoneManager.shared.phoneVC == nil {
            return
        }
        
        DispatchQueue.main.async {
            UIView.transition(with: topViewController.view, duration: 0.4, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                
                PhoneManager.shared.phoneVC?.view.removeFromSuperview()
            }, completion: nil)
        }
    }
    
    
    public func getPhoneStatus() {
        delegate?.getPhoneStatus(self, phoneStaus: PhoneManager.shared.phoneVC?.viewModel.status)
    }
    
}
