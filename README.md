# Foyer-Project
To run this Flutter project in Android Studio or Visual Studio Code follow these steps:

1. Import the Project:
   - To import a Flutter project from Git into either Android Studio or Visual Studio Code, you can follow these steps:

 - Using Android Studio:
i) Open Android Studio and select "Check out project from Version Control" on the welcome screen. Alternatively, you can go to "File" -> "New" -> "Project from Version Control".

ii) Choose Git from the list of version control options.

iii) In the "Git Repository URL" field, paste the URL of your Git repository. You can also specify the directory where you want to clone the project

iv) Click on the "Clone" button to initiate the cloning process. Android Studio will prompt you to confirm the location where you want to clone the project.

v) Once the project is cloned, Android Studio will automatically detect it as a Flutter project and set up the necessary dependencies.

- Using Visual Studio Code:
i)  Open Visual Studio Code and go to the Source Control view. You can access it by clicking on the source control icon on the left sidebar (or by pressing Ctrl + Shift + G) 

ii)  Click on the "Clone Repository" button or use the "Clone Repository" option from the command palette (accessed by pressing `Ctrl + Shift + P` )

iii)  Enter the URL of this Git repository and specify the directory where you want to clone the project.

iv)  Click "Clone" to initiate the cloning process. Visual Studio Code will prompt you to confirm the location where you want to clone the project.

 v) Once the project is cloned, Visual Studio Code will detect it as a Flutter project and prompt you to install the Flutter and Dart extensions. Follow the prompts to install the extensions.

3. Switch to the Master Branch:
   - Open the terminal in Android Studio or Visual Studio Code.
   - Change the directory to your project's root directory.
   - Run the command `git checkout master` to switch to the master branch. Make sure you have Git installed and the project is a Git repository.

4. Run the Application:
   - Open the terminal in Android Studio or Visual Studio Code.
   - Ensure that you have Flutter and Dart SDKs installed and properly set up.
   - Run the command `flutter run` in the terminal.
   - Wait for the build process to complete, and the application will launch on the connected device or emulator.
