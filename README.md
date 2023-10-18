# Eliseo M. Dayag Jr. Robot Framework Project
This project is a demonstration of using Robot Framework for automated testing.

## Installation
1. Clone the repository.
2. Open the project using PyCharm
3. Open the PyCharm terminal and install the required dependencies using the following pip commands:
    - pip install robotframework-seleniumlibrary
    - pip install webdriver_manager
4. Run the script by using below command:
   -  robot -v env:staging -v browser_type:chrome features/submit_application.robot