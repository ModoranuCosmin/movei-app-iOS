//
//  Extensions.swift
//  MovieApp
//
//  Created by Modoranu Cosmin on 09.08.2022.
//

import Foundation

extension String{
    
    func capitalizeFirstLatter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
