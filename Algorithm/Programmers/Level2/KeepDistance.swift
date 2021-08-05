//
//  KeepDistance.swift
//  Algorithm
//
//  Created by 홍정연 on 2021/08/05.
//

import Foundation

/*
 [2021 카카오 채용연계형 인턴십] 거리두기 확인하기
 https://programmers.co.kr/learn/courses/30/lessons/81302
 
 BFS - 너비 우선 탐색 방식
 
 개발자를 희망하는 죠르디가 카카오에 면접을 보러 왔습니다.

 코로나 바이러스 감염 예방을 위해 응시자들은 거리를 둬서 대기를 해야하는데 개발 직군 면접인 만큼
 아래와 같은 규칙으로 대기실에 거리를 두고 앉도록 안내하고 있습니다.

 대기실은 5개이며, 각 대기실은 5x5 크기입니다.
 거리두기를 위하여 응시자들 끼리는 맨해튼 거리1가 2 이하로 앉지 말아 주세요.
 단 응시자가 앉아있는 자리 사이가 파티션으로 막혀 있을 경우에는 허용합니다.
 
 예를 들어,
 5개의 대기실을 본 죠르디는 각 대기실에서 응시자들이 거리두기를 잘 기키고 있는지 알고 싶어졌습니다. 자리에 앉아있는 응시자들의 정보와 대기실 구조를 대기실별로 담은 2차원 문자열 배열 places가 매개변수로 주어집니다. 각 대기실별로 거리두기를 지키고 있으면 1을, 한 명이라도 지키지 않고 있으면 0을 배열에 담아 return 하도록 solution 함수를 완성해 주세요.

 제한사항
 places의 행 길이(대기실 개수) = 5
 places의 각 행은 하나의 대기실 구조를 나타냅니다.
 places의 열 길이(대기실 세로 길이) = 5
 places의 원소는 P,O,X로 이루어진 문자열입니다.
 places 원소의 길이(대기실 가로 길이) = 5
 P는 응시자가 앉아있는 자리를 의미합니다.
 O는 빈 테이블을 의미합니다.
 X는 파티션을 의미합니다.
 입력으로 주어지는 5개 대기실의 크기는 모두 5x5 입니다.
 return 값 형식
 1차원 정수 배열에 5개의 원소를 담아서 return 합니다.
 places에 담겨 있는 5개 대기실의 순서대로, 거리두기 준수 여부를 차례대로 배열에 담습니다.
 각 대기실 별로 모든 응시자가 거리두기를 지키고 있으면 1을, 한 명이라도 지키지 않고 있으면 0을 담습니다.
 */


// MARK: BFS 탐색 중 큐 타입으로 사용할 Tuple 타입 정의, x,y좌표와 맨해튼 거리 준수여부를 체크할 dist 거리 변수 할당
typealias Tuple = (x:Int, y:Int, dist: Int)

// MARK: dx, dy는 BFS 4방향 탐색을 위해 사용되는 값, 기존좌표 기준 x,y좌표 이동방 이동방향 추가해야할 값을 정의한 배열. index 0 부터 3까지 우,좌,상,하 순서
let dx = [0, 0 , -1, 1]
let dy = [1, -1 , 0, 0]

extension Array where Element == [String] {
    func BFS(_ x:Int, _ y: Int) -> Bool
    {
        // MARK: 처음 탐색하는 좌석이 'P'인 경우에만 탐색을 시작함, x,y는 P의 좌표
        var interviewRoom = self
        
        // MARK: 중복 탐색을 막기 위해 X 표시
        interviewRoom[x][y] = "X"
        
        // MARK: queue의 첫 탐색값 삽입
        var queue: [Tuple] = [(x,y,0)]
        
        // MARK: 현재 위치
        var cur:Int = 0
        
        while cur < queue.count {
            let nowPosition = (x: queue[cur].x, y: queue[cur].y)
            let dist = queue[cur].dist
            
            cur += 1
            
            for di in 0..<dx.count
            {
                let NewX = nowPosition.x + dx[di]
                let NewY = nowPosition.y + dy[di]
                
                // MARK: 설정한 범위에서 벗어나거나, 이미 검사한 곳, 파티션이 있는 곳이면 continue
                if NewX < 0 || NewX >= 5 || NewY < 0 || NewY >= 5 || interviewRoom[NewX][NewY] == "X" {continue}
                
                // MARK: 맨하탄 거리에 응시자(P)가 있으면 return false
                if interviewRoom[NewX][NewY] == "P" {return false}
                
                // MARK: 검사한 곳 표시
                interviewRoom[NewX][NewY] = "X"
                
                
                // MARK: 맨해튼 거리가 아직 탐색이 필요한 범위에 있음
                if dist + 1 < 2
                {
                    queue.append((NewX, NewY, dist + 1))
                }
                
            }
        }
        return true
    }
}

extension Array where Element == String {
    func isKeepDistance() -> Bool {
        let room = self.reduce(into: [[String]]()) { result, string in
            let array = [Character](string).map {"\($0)"}
            result.append(array)
        }
        
        for i in 0..<room.count {
            for j in 0..<room[i].count {
                if room[i][j] == "P" && !room.BFS(i, j) {
                    return false
                }
            }
        }
        
        
        return true
    }
}


func solution(_ places:[[String]]) -> [Int] {
    
    return places.reduce(into: [Int]()) { result, room in
        result.append(room.isKeepDistance() ? 1 : 0)
    }
}


func getManhattanDistance(T1: (Int, Int), T2: (Int, Int)) -> Int
{
    return abs(T1.0 - T2.0) + abs(T1.1 - T2.1)
}
