//
//  FinalViewViewController.swift
//  AnimalQuiz
//
//  Created by g.semshchikov on 30.08.2022.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateReslut()
    }
    
//2. Опеределить самый часто встречающийся тип животного
//3. Отобразить результаты на экране
    
    
}

// MARK: - Private methods
extension ResultsViewController {
    
    private func updateReslut() {
        
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = answers.map { $0.type }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType?) {
        animalTypeLabel.text = "Вы - \(animal?.rawValue ?? "🐶")"
        descriptionLabel.text = animal?.definition ?? ""
    }
}
