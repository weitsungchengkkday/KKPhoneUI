//
//  PhoneBackButton.swift
//  KKPhone
//
//  Created by KKday on 2020/11/25.
//

import UIKit

final class PhoneBackView: UIView {
    
    private let backNumBtn = UIButton()
    private let imageView = UIImageView()
    private var image: UIImage
    let whiteView = UIView()

    var backNumHandler: () -> Void = {}
    
    required init(image: UIImage) {
        self.image = image
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        whiteView.layer.cornerRadius = 25
        whiteView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageView.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        imageView.image = image
        self.addSubview(whiteView)
        self.addSubview(imageView)
        self.addSubview(backNumBtn)

        self.snp.makeConstraints { maker in
            maker.height.width.equalTo(65)
        }
        
        self.whiteView.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.height.width.equalTo(50)
        }
        
        self.imageView.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
        
        self.backNumBtn.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
        
        self.backNumBtn.addTarget(self, action: #selector(backNumber), for: .touchUpInside)
    }
  
    @objc func backNumber() {
        backNumHandler()
    }
    
}
