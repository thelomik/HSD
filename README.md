# Animal Recognition System in CLIPS

## Overview
This project implements an **Animal Recognition System** using the **CLIPS** expert system. It determines an animal based on its characteristics, such as:
- **Lifespan** (short, medium, long)
- **Body length** (small, medium, large)
- **Weight** (light, medium, heavy)
- **Diet type** (herbivore, carnivore)
- **Lifestyle** (diurnal, nocturnal)

The system asks the user a series of questions to identify an animal from a predefined set of rules. Each characteristic includes a scale with appropriate thresholds, ensuring clear and precise inputs.

## Features
- **Rule-Based Animal Identification**: Determines the animal based on predefined rules.
- **Interactive User Input**: Asks questions to gather information about the animal's characteristics.
- **Clear Scales**: Each characteristic uses intuitive scales (e.g., weight thresholds).
- **Expandable Design**: Easily add new rules and animals by modifying the CLIPS file.

## Installation
To run the Animal Recognition System, you need to have **CLIPS** installed on your machine.

1. [Download CLIPS](http://www.clipsrules.net/) and follow the installation instructions for your operating system.
2. Clone this repository:
   ```bash
   git clone https://github.com/your-username/animal-recognition-clips.git
   ```
3. Navigate to the project directory:
   ```bash
   cd animal-recognition-clips
   ```

## Usage
1. Open the CLIPS environment:
   ```bash
   clips
   ```
2. Load the `animal_recognition.clp` file:
   ```clips
   (load "animal_recognition.clp")
   ```
3. Run the system:
   ```clips
   (reset)
   (run)
   ```
4. Answer the questions as prompted by the system. Example:
   - "Podaj długość życia (krótka: <5 lat, średnia: 5-20 lat, długa: >20 lat):"
   - "Podaj wagę (lekka: <10 kg, średnia: 10-100 kg, ciężka: >100 kg):"

## Ruleset
The system uses a predefined set of rules to determine the animal based on user inputs. For example:
- If the lifespan is short and the body length is large, the system identifies the animal as **Anakonda**.
- If the lifespan is medium, the diet type is herbivore, and the weight is medium, the system identifies the animal as **Kapibara**.

You can view and modify the rules in the `animal_recognition.clp` file.

## Adding New Animals
To add new animals:
1. Open `animal_recognition.clp` in a text editor.
2. Add new rules following the existing format. Example:
   ```clips
   (defrule NewRule
       (lifespan long)
       (weight heavy)
       (diet carnivore)
   =>
       (assert (animal TIGER)))
   ```
3. Save the file and reload it in the CLIPS environment.

## Example Interaction
```
Podaj długość życia (krótka: <5 lat, średnia: 5-20 lat, długa: >20 lat): długa
Podaj wagę (lekka: <10 kg, średnia: 10-100 kg, ciężka: >100 kg): ciężka
Podaj typ pokarmu (roślinożerca, mięsożerca): mięsożerca

Wynik: Zwierzę = ORKA
```

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your feature:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature description"
   ```
4. Push the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments
- [CLIPS Rules Engine](http://www.clipsrules.net/): The foundation of this project.
- Inspiration from rule-based expert systems for classification problems.

