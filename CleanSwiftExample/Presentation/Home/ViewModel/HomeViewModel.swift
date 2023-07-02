//
//  HomeViewModel.swift
//  CleanSwiftExample
//
//  Created by Pro on 04/06/2023.
//

import Foundation

class HomeViewModel {
    
    private var getDataUseCase: GetDataUseCase
    init(getDataUseCase: GetDataUseCase = DefaultGetDataUseCase()) {
        self.getDataUseCase = getDataUseCase
    }
    
    func fetchData(fromParameters param: Int, completion: @escaping (Result<Int, Error>) -> Void) {
        
        let input = GetDataUseCaseInput(inputValue: param)
        getDataUseCase.fetch(parameters: input) { result in
            switch result {
            case .success(let output):
                let updatedValue = output.newValue
                completion(.success(updatedValue))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
