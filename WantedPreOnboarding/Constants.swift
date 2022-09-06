//
//  Constants.swift
//  WantedPreOnboarding
//
//  Created by Susan Kim on 2022/09/06.
//

import Foundation

let API_KEY = "707c35c4a1c94c67c6d4d6b1be90c29d"
let COUNTRY_LIST = [
    "공주", "광주(전라남도)", "구미", "군산", "대구", "대전", "목포", "부산", "서산", "서울", "속초", "수원", "순천", "울산", "익산", "전주", "제주시", "천안", "청주", "춘천"
    ]

enum Country: String, CaseIterable {
    case gongju         = "공주"
    case gwangju        = "광주(전라남도)"
    case gumi           = "구미"
    case gunsan         = "군산"
    case daegu          = "대구"
    case daejeon        = "대전"
    case mokpo          = "목포"
    case busan          = "부산"
    case seosan         = "서산"
    case seoul          = "서울"
    case sokcho         = "속초"
    case suwon          = "수원"
    case suncheon       = "순천"
    case ulsan          = "울산"
    case iksan          = "익산"
    case jeonju         = "전주"
    case jeju           = "제주시"
    case cheonan        = "천안"
    case cheongju       = "청주"
    case chuncheon      = "춘천"
}
