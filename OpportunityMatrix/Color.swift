//
//  Color.swift
//  OpportunityMatrix
//
//  Created by Maxwell Zhou on 7/5/15.
//  Copyright © 2015 ILoveLovinda. All rights reserved.
//

import Foundation
public final class Color {


    public static let Black = UIColor(hexValue: 0x000000)
    public static let White = UIColor(hexValue: 0xFFFFFF)

    // The LinkedIn accent palette consists of four bright colors chosen to have high visibility.
    // These colors should be used sparingly for feature design elements in the following order:
    public static let AccentBlue = Blue5
    public static let AccentPurple = Purple5
    public static let AccentRed = Red5
    public static let AccentOrange = Orange5

    // Please use the following tones for page backgrounds, containers, and other UI elements.
    // They have been chosen for optimal contrast with our typography and iconography systems
    // (meeting WCAG 2.0 minimum contrast requirements).
    public static let LightGray = UIColor(hexValue: 0xF0F3F6)
    public static let Gray1 = UIColor(hexValue: 0xE6E9EC)
    public static let Gray2 = UIColor(hexValue: 0xD0D3D6)
    public static let Gray3 = UIColor(hexValue: 0xB6B9BC)
    public static let Gray4 = UIColor(hexValue: 0xA0A3A6)
    public static let Gray5 = UIColor(hexValue: 0x86898C)
    public static let Gray6 = UIColor(hexValue: 0x737679)
    public static let Gray7 = UIColor(hexValue: 0x595C5F)
    public static let Gray8 = UIColor(hexValue: 0x434649)
    public static let Gray9 = UIColor(hexValue: 0x303336)
    // The following colors have been chosen for alert/notification backgrounds
    // in order to meet WCAG 2.0 minumum contrast standards.
    public static let AlertSuccessColor = Green7
    public static let AlertYieldColor = Orange6
    public static let AlertErrorColor = Red6
    public static let AlertNotifyColor = Gray6

    // The LinkedIn extended palette is a comprehensive set of colors chosen primarily to offer
    // flexibility in data visualization. These colors should be used sparingly,
    // with the corporate and accent colors dominating the design.
    public static let Blue1 = UIColor(hexValue: 0xCFEDFB)
    public static let Blue2 = UIColor(hexValue: 0x9BDAF3)
    public static let Blue3 = UIColor(hexValue: 0x68C7EC)
    public static let Blue4 = UIColor(hexValue: 0x34B3E4)
    public static let Blue5 = UIColor(hexValue: 0x00A0DC)
    public static let Blue6 = UIColor(hexValue: 0x008CC9)
    public static let Blue7 = UIColor(hexValue: 0x0077B5)
    public static let Blue8 = UIColor(hexValue: 0x005E93)
    public static let Blue9 = UIColor(hexValue: 0x004471)

    public static let Purple1 = UIColor(hexValue: 0xEBE4FF)
    public static let Purple2 = UIColor(hexValue: 0xD8CCF4)
    public static let Purple3 = UIColor(hexValue: 0xBFABE6)
    public static let Purple4 = UIColor(hexValue: 0xA589D9)
    public static let Purple5 = UIColor(hexValue: 0x8C68CB)
    public static let Purple6 = UIColor(hexValue: 0x7C5BBB)
    public static let Purple7 = UIColor(hexValue: 0x6A4BA7)
    public static let Purple8 = UIColor(hexValue: 0x573B93)
    public static let Purple9 = UIColor(hexValue: 0x452B7F)

    public static let Red1 = UIColor(hexValue: 0xFFE0DA)
    public static let Red2 = UIColor(hexValue: 0xFAC2BB)
    public static let Red3 = UIColor(hexValue: 0xF59890)
    public static let Red4 = UIColor(hexValue: 0xF16D64)
    public static let Red5 = UIColor(hexValue: 0xEC4339)
    public static let Red6 = UIColor(hexValue: 0xDD2E1F)
    public static let Red7 = UIColor(hexValue: 0xC11F1D)
    public static let Red8 = UIColor(hexValue: 0xA40F1C)
    public static let Red9 = UIColor(hexValue: 0x88001A)

    public static let Orange1 = UIColor(hexValue: 0xFFE7BB)
    public static let Orange2 = UIColor(hexValue: 0xF8CD94)
    public static let Orange3 = UIColor(hexValue: 0xF7B26A)
    public static let Orange4 = UIColor(hexValue: 0xF59640)
    public static let Orange5 = UIColor(hexValue: 0xF47B16)
    public static let Orange6 = UIColor(hexValue: 0xEC640C)
    public static let Orange7 = UIColor(hexValue: 0xCD5308)
    public static let Orange8 = UIColor(hexValue: 0xAF4104)
    public static let Orange9 = UIColor(hexValue: 0x903000)

    public static let Teal1 = UIColor(hexValue: 0xD2ECEB)
    public static let Teal2 = UIColor(hexValue: 0x9EDDDD)
    public static let Teal3 = UIColor(hexValue: 0x69CDCF)
    public static let Teal4 = UIColor(hexValue: 0x35BEC1)
    public static let Teal5 = UIColor(hexValue: 0x00AEB3)
    public static let Teal6 = UIColor(hexValue: 0x009EA5)
    public static let Teal7 = UIColor(hexValue: 0x008891)
    public static let Teal8 = UIColor(hexValue: 0x00727D)
    public static let Teal9 = UIColor(hexValue: 0x005C69)

    public static let Yellow1 = UIColor(hexValue: 0xFFF2B6)
    public static let Yellow2 = UIColor(hexValue: 0xFBE491)
    public static let Yellow3 = UIColor(hexValue: 0xF7D56B)
    public static let Yellow4 = UIColor(hexValue: 0xF3C746)
    public static let Yellow5 = UIColor(hexValue: 0xEFB920)
    public static let Yellow6 = UIColor(hexValue: 0xE6A700)
    public static let Yellow7 = UIColor(hexValue: 0xCA9400)
    public static let Yellow8 = UIColor(hexValue: 0xAA7D00)
    public static let Yellow9 = UIColor(hexValue: 0x8B6700)

    public static let Pink1 = UIColor(hexValue: 0xFFDFF2)
    public static let Pink2 = UIColor(hexValue: 0xFFC4E4)
    public static let Pink3 = UIColor(hexValue: 0xF99ACA)
    public static let Pink4 = UIColor(hexValue: 0xF371AF)
    public static let Pink5 = UIColor(hexValue: 0xED4795)
    public static let Pink6 = UIColor(hexValue: 0xE2247F)
    public static let Pink7 = UIColor(hexValue: 0xC9186E)
    public static let Pink8 = UIColor(hexValue: 0xB10C5C)
    public static let Pink9 = UIColor(hexValue: 0x870044)

    public static let Green1 = UIColor(hexValue: 0xE0F4BE)
    public static let Green2 = UIColor(hexValue: 0xC7E59A)
    public static let Green3 = UIColor(hexValue: 0xAED677)
    public static let Green4 = UIColor(hexValue: 0x95C753)
    public static let Green5 = UIColor(hexValue: 0x7CB82F)
    public static let Green6 = UIColor(hexValue: 0x60AA14)
    public static let Green7 = UIColor(hexValue: 0x4E8F13)
    public static let Green8 = UIColor(hexValue: 0x3B7511)
    public static let Green9 = UIColor(hexValue: 0x295A10)

}