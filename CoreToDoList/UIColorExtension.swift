//
//  UIColorExtension.swift
//  CoreToDoList
//
//  Created by 及川ひな on 2019/11/01.
//  Copyright © 2019 oikawa. All rights reserved.
//

import UIKit

// カラー定義クラス
extension UIColor {

    // カラーコード16進数変換
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
