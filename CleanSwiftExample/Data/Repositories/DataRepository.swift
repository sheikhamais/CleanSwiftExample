//
//  DataRepository.swift
//  CleanSwiftExample
//
//  Created by Pro on 02/07/2023.
//

import Foundation

class DataRepository: DataRepositoryInterface {
    
    func fetchNewData(input: Int, result: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            result(.success(Int.random(in: 0...20)))
        }
    }
}
