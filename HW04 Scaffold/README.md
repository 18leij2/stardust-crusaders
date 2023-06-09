# Stardust Crusaders
## Summary
Your spaceship was traveling at light speeds when the hyperspace guidance system malfunctioned! You were marooned at a dangerous asteroid field with no communications, autopilot, or weaponary systems! Your only option is to navigate with the left and right thrusters to make it past the asteroid field.

## Controls and Navigation
- Press the corresponding `START` key to begin the game.
- While on the menu screen, press the `A` button to navigate between the menu and highscore screen.
- Pressing `START` while in-game will pause the game. Press `START` again while in this phase to resume, or `SELECT` to return to menu.
- Pressing `START` while in the win or lose screen will return you to the main menu.
- Use the corresponding `LEFT` and `RIGHT` keys to move the ship!
- Press either the `L` or `R` key to activate dodge!

## Tips
1. Dodge the asteroids coming your way! The shield systems are down - one hit and you're a goner! The dodge also gives you a small speed boost. Use it to steer clear from danger!
2. Aside from moving left and right, dodging is a critical mechanic! Try to save the dodge when you're really in a pickle.
3. The square icon on the top right indicates your dodge cooldown. You can dodge every 3 seconds, and the dodge lasts for 1 second. Make the best use of it!
4. Your score will automatically increase over time. Try to stay alive as long as possible to beat the highscore!
5. As a survival game, there is no winning - but there is a hard cap at 2 minutes, which presents a secret win screen! Otherwise, you will be brought to the regular lose screen. 
6. Your ship may be on the verge of breaking, but that means you can afford to lose some non essentials! Your actual hitbox is much smaller than it seems - you can afford to take hits to your sides and wings - just don't let your main hull get hit!
7. If you're really struggling to reach the 2 minute win screen, press the `B` button while in game to activate permanent invulnerability (do note that this is considered a blatant cheat).


---

## No-nonsense Section for the TAs
For ease of grading, I have provided the feature requirements as listed below:
1. At least 2 structs: Player struct, Asteroid struct
2. At least 1 array: Asteroid array
3. Object pooling: Asteroid array is cycled to activate next inactive asteroid
4. State machine: Menu screen, highscore screen, game screen, pause screen, and win/lose screen are included
5. Navigating the state machine: Each state has a specific way to reach that state
6. Meaningful text: Score text, Pause text, titles, and highscore text are all present
7. Non-static text: Score updates in real time
8. At least 2 moving objects: Player, Asteroid
9. Collisions that matter: Player loses when colliding with an asteroid
10. At least 1 non-fullscreen image: The game state switches between the player ship image and dodge image
11. At least 1 fullscreen image: The menu, highscore, win, and lose screens all feature a fullscreen image
12. At least 3 buttons used for input: `A`, `START`, `SELECT`, `LEFT`, `RIGHT`, `LEFT SHOULDER`, and `RIGHT SHOULDER` buttons are all used (technically `B` is also used)
13. At least 2 different sounds: Channel 4 is used when player is hit, channel 2 is used when player activates dodge
14. A README.md file: You're reading it right now!
15. No flicker at all: With Mode 4, there is no game flicker!
16. At least one game object with switching image: The player image switches when activating dodge
17. Dodge mechanic: The player is able to dodge, and it has a cooldown
18. Score counter that persists between playthroughs: Highscore can be seen from the menu or in the win/lose screen
10. Entirely written in Mode 4: See mode4.c
20. At least 6 .c files: mode4.c, print.c, font.c, gba.c, main.c, game.c, ship.c, space.c, dodge.c, shipProto.c
21. At least 5 .h files: mode4.h, print.h, font.h, gba.h, game.h, ship.h, space.h, dodge.h, shipProto.h
22. Good organization: code is sectioned into where it best belongs
23. Meaningful comments: Comments are added where necessary to provide clarity