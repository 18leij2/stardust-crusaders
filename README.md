# Stardust Crusaders

This is a submission for the CS2261 homework assignment. It is a single player game where the aim is to pilot a ship and avoid numerous randomly generated obstacles. This project explores the concepts of Mode 4 on the GBA. Further details on the game mechanics, controls, and game summary can be found [here](./HW04%20Scaffold/README.md).

## Project Setup
This game was developed for the GBA. To run the game on a Mac or Windows device, the [mGBA emulator](https://mgba.io/) must first be installed. Then, download or clone the repository. Open the emulator, select `File > Load ROM`, and open the `HW04_LeiJason.zip` file. Alternatively, opening the `Project.gba` file in the `HW04 Scaffold` folder through the emulator will also work.

To access and edit the project on Windows, the mGBA emulator and Visual Studio Code must first be installed. Then, install and set up the [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install). Additionally, install [Docker Desktop](https://www.docker.com/products/docker-desktop/). In the main project folder, locate the `.vscode` folder, then find the `tasks.json` file and edit line 15 to the correct file path of the installed GBA emulator. Finally, while Docker Desktop is running, open the Scaffold folder in Visual Studio Code, open the `main.c` file, and hit `ctrl`+`shift`+`b` to build and run the project.
