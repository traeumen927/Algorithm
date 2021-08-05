//
//  NumericAndEngWord.swift
//  Algorithm
//
//  Created by 홍정연 on 2021/08/05.
//

import Foundation

/*
 [2021 카카오 채용연계형 인턴십] 숫자 문자여로가 영단어
 https://programmers.co.kr/learn/courses/30/lessons/81301
 
 네오와 프로도가 숫자놀이를 하고 있습니다. 네오가 프로도에게 숫자를 건넬 때 일부 자릿수를 영단어로 바꾼 카드를 건네주면 프로도는 원래 숫자를 찾는 게임입니다.

 다음은 숫자의 일부 자릿수를 영단어로 바꾸는 예시입니다.

 1478 → "one4seveneight"
 234567 → "23four5six7"
 10203 → "1zerotwozero3"
 이렇게 숫자의 일부 자릿수가 영단어로 바뀌어졌거나, 혹은 바뀌지 않고 그대로인 문자열 s가 매개변수로 주어집니다. s가 의미하는 원래 숫자를 return 하도록 solution 함수를 완성해주세요.

 참고로 각 숫자에 대응되는 영단어는 다음 표와 같습니다.

 숫자    영단어
 0    zero
 1    one
 2    two
 3    three
 4    four
 5    five
 6    six
 7    seven
 8    eight
 9    nine
 제한사항
 1 ≤ s의 길이 ≤ 50
 s가 "zero" 또는 "0"으로 시작하는 경우는 주어지지 않습니다.
 return 값이 1 이상 2,000,000,000 이하의 정수가 되는 올바른 입력만 s로 주어집니다.
 */

enum NumericString: String, CaseIterable {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var NumericValue: Int {
        switch self {
        case .zero:
            return 0
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        }
    }
}

func solution(_ s:String) -> Int {
    
    var NumericWord = s
    
    for item in NumericString.allCases.map( {$0.rawValue})
    {
        if let numeric = NumericString(rawValue: item)?.NumericValue
        {
            NumericWord = NumericWord.replacingOccurrences(of: item, with: String(numeric))
        }
    }
    
    guard let result = Int(NumericWord) else {return 0}
    
    return result
}
