//
//  Box.swift
//  DummyBLE_NeoPulse
//
//  Created by Abhishek Chaudhari on 26/08/18.
//  Copyright © 2018 Abhishek Chaudhari. All rights reserved.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
