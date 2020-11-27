//
//  PhoneNumberView.swift
//  KKdayPortal
//
//  Created by KKday on 2020/11/24.
//  Copyright © 2020 WEI-TSUNG CHENG. All rights reserved.
//

import UIKit
import SnapKit

final class PhoneNumberView: UIView {
    
    private let numBtn = UIButton()
    private let imageView = UIImageView()
    private var image: UIImage
    let whiteView = UIView()
    
    var addNumHandler: () -> Void = {}
    
    required init(image: UIImage) {
        self.image = image
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        whiteView.layer.cornerRadius = 30
        whiteView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageView.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        imageView.image = image
        self.addSubview(whiteView)
        self.addSubview(imageView)
        self.addSubview(numBtn)
        
        self.snp.makeConstraints { maker in
            maker.height.width.equalTo(80)
        }
        
        self.whiteView.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.height.width.equalTo(60)
        }
        
        self.imageView.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
        
        self.numBtn.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
        
        numBtn.addTarget(self, action: #selector(addNumber), for: .touchUpInside)
    }

    @objc func addNumber() {
        addNumHandler()
    }

}
