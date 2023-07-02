//
//  GetDataUseCase.swift
//  CleanSwiftExample
//
//  Created by Pro on 01/07/2023.
//

import Foundation

protocol GetDataUseCase {
    func fetch(parameters: GetDataUseCaseInput, resultCompletion: @escaping (Result<GetDataUseCaseOutput, Error>) -> Void)
}

class DefaultGetDataUseCase: GetDataUseCase {
    
    private var dataRepository = DataRepository()
    
    func fetch(parameters: GetDataUseCaseInput, resultCompletion: @escaping (Result<GetDataUseCaseOutput, Error>) -> Void) {
        dataRepository.fetchNewData(input: parameters.inputValue) { result in
            switch result {
            case .success(let newData):
                let output = GetDataUseCaseOutput(newValue: newData)
                resultCompletion(.success(output))
            case .failure(let error):
                resultCompletion(.failure(error))
            }
        }
    }
}
