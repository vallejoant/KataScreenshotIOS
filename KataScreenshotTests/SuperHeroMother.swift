//
//  SuperHeroMother.swift
//  KataScreenshot
//
//  Created by Sergio Gutiérrez on 09/01/17.
//  Copyright © 2017 Karumi. All rights reserved.
//

import Foundation
@testable import KataScreenshot

class SuperHeroMother {
    static func givenASuperHero(named name: String = "", description: String = "", isAvenger: Bool) -> SuperHero {
        let superHero = SuperHero(
            name: name,
            photo: URL(string: ""),
            isAvenger: isAvenger,
            description: description
        )
        return superHero
    }
}
