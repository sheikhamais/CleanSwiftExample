//
//  DataRepositoryInterface.swift
//  CleanSwiftExample
//
//  Created by Pro on 02/07/2023.
//

import Foundation

protocol DataRepositoryInterface {
    func fetchNewData(input: Int, result: @escaping (Result<Int, Error>) -> Void)
}
