//
//  SuperHeroDetailViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Sergio Gutiérrez on 22/12/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
@testable import KataScreenshot

class SuperHeroDetailViewControllerTests: ScreenshotTest {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsSuperHeroWithNoBadge() {
        let superHero = givenANormalSuperHero(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)

        verify(viewController: viewController)
    }

    func testShowsSuperHeroWithBadge() {
        let superHero = givenANormalSuperHero(isAvenger: true)

        let viewController = getSuperHeroDetailViewController(superHero.name)

        verify(viewController: viewController)
    }
    
    func testShowsLongNamedSuperHeroWithNoBadge() {
        let superHero = givenALongNamedSuperHero(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsLongNamedSuperHeroWithBadge() {
        let superHero = givenALongNamedSuperHero(isAvenger: true)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsShortNamedSuperHeroWithNoBadge() {
        let superHero = givenAShortNamedSuperHero(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsShortNamedSuperHeroWithBadge() {
        let superHero = givenAShortNamedSuperHero(isAvenger: true)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsEmptyNamedSuperHeroWithNoBadge() {
        let superHero = givenASuperHero(named: "", description: "", isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsEmptyNamedSuperHeroWithBadge() {
        let superHero = givenASuperHero(named: "", description: "", isAvenger: true)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
// MARK: Utilities
    
    func givenANormalSuperHero(isAvenger: Bool) -> SuperHero {
        return givenASuperHero(named: "Mr. Clean",
                               description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isAvenger: isAvenger)
    }
    
    func givenALongNamedSuperHero(isAvenger: Bool) -> SuperHero {
        return givenASuperHero(named: "Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean Mr. Clean",
                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",
                               isAvenger: isAvenger)
    }
    
    func givenAShortNamedSuperHero(isAvenger: Bool) -> SuperHero {
        return givenASuperHero(named: "M",
                               description: "L",
                               isAvenger: isAvenger)
    }
    
    func givenASuperHero(named name: String, description: String, isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(named: name, description: description, isAvenger: isAvenger)
        repository.superHeroes = [superHero]
        return superHero
    }

    fileprivate func getSuperHeroDetailViewController(_ superHeroName: String) -> UIViewController {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(
            ui: superHeroDetailViewController,
            superHeroName: superHeroName,
            getSuperHeroByName: GetSuperHeroByName(repository: repository)
        )

        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroDetailViewController]

        return rootViewController
    }
}
