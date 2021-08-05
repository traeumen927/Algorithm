//
//  BFS.swift
//  Algorithm
//
//  Created by 홍정연 on 2021/08/05.
//

import Foundation

/*
 BFS(Breadth First Search)
 : 다차원 배열에서 각 칸을 방문할 때 너비를 우선으로 방문하는 알고리즘
 
 BFS는 그래프라는 자료구조에서 모든 노드를 방문하기 위한 알고리즘
 여기서 말하는 그래프는 정점과 간선으로 이루어진 자료구조
 
 
 ex) O가 표시된 위치 확인하기
 
   0 1 2 3 4 5 6 7 8 9
 0 O O O X O O O O O O
 1 O X X X O X X X X X
 2 O O O X O X X X X X
 3 O O X X O X X X X X
 4 X O X X X X X X X X
 5 X X X X X X X X X X
 6 X X X X X X X X X X
 
 
 BFS 알고리즘에서는 좌표를 담을 큐가 필요함
 
 
 */
