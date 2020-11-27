//
//  PhoneEndCallView.swift
//  KKPhone
//
//  Created by KKday on 2020/11/25.
//

import UIKit

final class PhoneEndCallView: UIView {
    
    private let endCallNumBtn = UIButton()
    private let imageView = UIImageView()
    private var image: UIImage
    let whiteView = UIView()
    
    var endCallNumHandler: () -> Void = {}
    
    required init(image: UIImage) {
        self.image = image
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        whiteView.layer.cornerRadius = 38
        whiteView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageView.tintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        imageView.image = image
        self.addSubview(whiteView)
        self.addSubview(imageView)
        self.addSubview(endCallNumBtn)
        
        self.snp.makeConstraints { maker in
            maker.height.width.equalTo(90)
        }
        
        self.whiteView.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.height.width.equalTo(76)
        }
        
        self.imageView.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
        
        self.endCallNumBtn.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
        
        self.endCallNumBtn.addTarget(self, action: #selector(endCallNumber), for: .touchUpInside)
    }
    
    @objc func endCallNumber() {
        endCallNumHandler()
    }
    
}
