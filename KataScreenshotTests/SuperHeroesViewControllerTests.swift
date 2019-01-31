//
//  SuperHeroesViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Sergio Gutiérrez on 22/12/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
@testable import KataScreenshot

class SuperHeroesViewControllerTests: ScreenshotTest {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsEmptyCase() {
        givenThereAreNoSuperHeroes()

        let viewController = getSuperHeroViewController()

        verify(viewController: viewController)
    }
    
    func testShowsSuperHeroesListWhenThereAreSomeSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes()
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowsAvengersListWhenThereAreSomeAvengers() {
        _ = givenThereAreSomeAvengers()
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowsOneSuperHeroWhenThereAreOnlyOneSuperHero() {
        _ = givenThereAreSomeSuperHeroes(1)
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowsOneAvengerWhenThereAreOnlyOneAvenger() {
        _ = givenThereAreSomeAvengers(1)
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowsLongNameWhenThereAreOneLongNamedSuperHero() {
        _ = givenThereAreANamedSuperHero("SuperHero SuperHero SuperHero SuperHero SuperHero SuperHero")
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowsLongNameWhenThereAreOneLongNamedAvenger() {
        _ = givenThereAreANamedSuperHero("SuperHero SuperHero SuperHero SuperHero SuperHero SuperHero", avenger: true)
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowsEmptyNameWhenThereAreOneEmptyNamedSuperHero() {
        _ = givenThereAreANamedSuperHero()
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowsEmptyNameWhenThereAreOneEmptyNamedAvenger() {
        _ = givenThereAreANamedSuperHero(avenger: true)
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowsSingleCharacterNameWhenThereAreOneSingleCharacterNamedSuperHero() {
        _ = givenThereAreANamedSuperHero("S")
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowsSingleCharacterNameWhenThereAreOneSingleCharacterNamedAvenger() {
        _ = givenThereAreANamedSuperHero("S", avenger: true)
        
        let viewController = getSuperHeroViewController()
        
        verify(viewController: viewController)
    }

// MARK: Utilities
    
    fileprivate func givenThereAreSomeAvengers(_ numberOfAvengers: Int = 10) -> [SuperHero] {
        return givenThereAreSomeSuperHeroes(numberOfAvengers, avengers: true)
    }

    fileprivate func givenThereAreNoSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes(0)
    }

    fileprivate func givenThereAreSomeSuperHeroes(_ numberOfSuperHeroes: Int = 10,
        avengers: Bool = false) -> [SuperHero] {
        var superHeroes = [SuperHero]()
        for i in 0..<numberOfSuperHeroes {
            let superHero = SuperHero(name: "SuperHero - \(i)",
                photo: URL(string: ""),
                isAvenger: avengers, description: "Description - \(i)")
            superHeroes.append(superHero)
        }
        repository.superHeroes = superHeroes
        return superHeroes
    }
    
    fileprivate func givenThereAreANamedSuperHero(_ name: String = "",
                                                  avenger: Bool = false) -> [SuperHero] {
        var superHeroes = [SuperHero]()
        let superHero = SuperHero(name: name,
            photo: URL(string: ""),
            isAvenger: avenger, description: "Description")
        superHeroes.append(superHero)

        repository.superHeroes = superHeroes
        return superHeroes
    }

    fileprivate func getSuperHeroViewController() -> UIViewController {
        let superHeroesViewController = ServiceLocator()
            .provideSuperHeroesViewController() as! SuperHeroesViewController
        superHeroesViewController.presenter = SuperHeroesPresenter(
            ui: superHeroesViewController,
            getSuperHeroes: GetSuperHeroes(repository: repository)
        )

        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroesViewController]

        return rootViewController
    }
}
