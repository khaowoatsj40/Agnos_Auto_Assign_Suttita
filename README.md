# Agnos_Auto_Assign_Suttita

## Description
This repository contains automated tests for testing the functionality of a robot system using [Robot Framework](https://robotframework.org/). Robot Framework is a generic test automation framework for acceptance testing and robotic process automation (RPA).

## Directory Structure
Agnos_Auto_Assign_Suttita
│
├── keywords/                    # Directory keywords
│   ├── CommonKeywords.robot
│   └── HomePageKeywords.robot
│   └── LoginPageKeywords.robot
│   └── RegisterPageKeywords.robot
│
├── resources/                   # Directory resources    
│   ├── config/
│       ├── config.yaml
│   ├── testdata/
│       ├── testdata.yaml
│
├── testcases/                   # Directory test cases    
│   ├── LoginTestcases.robot
│   └── NavigateTabsPagesTestcases.robot
│   └── RegisterTestcases.robot


## Installation

1. Install python
2. Install pip
3. Install VScode
4. Install Browsers (xe. Chrome)
5. Install robotframework, robotframework-seleniumlibrary, PyYAML
6. Clone the repository : git clone https://github.com/khaowoatsj40/Agnos_Auto_Assign_Suttita.git
7. Run File : robot filename.robot (ex. ./testcases/NavigateTabsPagesTestcases.robot)


