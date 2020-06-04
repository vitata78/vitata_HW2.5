//
//  ResultsViewController.swift
//  testFour
//
//  Created by Svetlana Tolstova on 6/3/20.
//  Copyright © 2020 APNET HQ LLC. All rights reserved.
//

import UIKit
import Foundation

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var resultTitleLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    // MARK: - Public properties
    var answersChosen: [Answer]!
    
    private var animalsArray: [AnimalType] = []
    private var animalResult: AnimalType = .dog
    
    // 1. Передать массив с ответами на этот экран
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавиться от кнопки back

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        showResult()
    }
}

// MARK: - Private methods
extension ResultsViewController {
    
    private func showResult() {
        
        // собираем массив из типов животных из всех ответов
        for item in answersChosen {
            animalsArray.append(item.type)
        }
        
        // находим кто чаще встречался
        var maxAnimalCount = 0
        let countAnimals = NSCountedSet(array: animalsArray)
        
        for item in countAnimals.allObjects {
            if countAnimals.count(for: item) > maxAnimalCount {
                maxAnimalCount = countAnimals.count(for: item)
                animalResult = item as! AnimalType
            }
        }
        
        // выводим на экран
        switch animalResult {
        case .dog:
            resultTitleLabel.text = "Вы - \(AnimalType.dog.rawValue)"
            resultTextLabel.text = AnimalType.dog.definition
        case .cat:
            resultTitleLabel.text = "Вы - \(AnimalType.cat.rawValue)"
            resultTextLabel.text = AnimalType.cat.definition
        case .turtle:
            resultTitleLabel.text = "Вы - \(AnimalType.turtle.rawValue)"
            resultTextLabel.text = AnimalType.turtle.definition
        case .rabbit:
            resultTitleLabel.text = "Вы - \(AnimalType.rabbit.rawValue)"
            resultTextLabel.text = AnimalType.rabbit.definition
        }
        
    }
    
}
