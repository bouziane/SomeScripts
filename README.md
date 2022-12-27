# Increment the version number of a Flutter project

This script automatically increments the version of your Flutter project. It can be run before sending the code to a pipeline CI/CD, such as on GitLab.

###  Prerequisites

-   Existing Flutter project
-   Python 3 installed on your computer

### Usage

 1.  Place the script in the root directory of your Flutter project.
 2.  Run the script by typing `python3 increment_version.py` in the command prompt.

### Notes

 - This script only modifies the `pubspec.yaml` and `web/index.html` files. 

However, you will have to change the version directly in the android and ios projects

