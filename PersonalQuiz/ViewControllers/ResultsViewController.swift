//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var emogiLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    var answersChoosen: [Answer] = [] 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        showResult()
    }
    
    private func animalsFromAnswersChoosen() -> [AnimalType]{
        var animals: [AnimalType] = []
        for answer in answersChoosen {
            animals.append(answer.type)
        }
        return animals
    }
    
    private func identifyCommonAnimal() -> AnimalType? {
        let animals = animalsFromAnswersChoosen()
        var counts: [AnimalType: Int] = [:]
        animals.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }
        if let (value, _) = counts.max(by: {$0.1 < $1.1}) {
            return value
        } else {
            return nil
        }
    }
    
    private func showResult() {
        if let animal = identifyCommonAnimal() {
            descriptionLabel.text = animal.definition
            emogiLabel.text = "Вы - \(animal.rawValue)"
        }
    }
}


