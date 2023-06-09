#include "gba.h"
#include "game.h"
#include <stdlib.h>
#include "ship.h"
#include "dodge.h"
#include "shipProto.h"
#include "sound.h"

// structs on the screen
PLAYER player;
ASTEROID asteroids[ASTEROIDCOUNT];

// variables
int score;
int time;
int damageTime;
int dodgeTime;
int lives;
int highscore;
unsigned short colors[NUMCOLORS] = {BLACK, WHITE, GRAY, RED, GREEN, BLUE, CYAN, MAGENTA, YELLOW, BROWN};

// initialize
void initGame() {
    score = 0;
    dodgeTime = 0;

    initPlayer();
    initAsteroids();
    lives = player.lives;

    // initialize the colors

    // load the ship colors
    DMANow(3, shipProtoPal, PALETTE, 256);
    DMANow(3, dodgePal, PALETTE, 16);

    // load custom colors at the end
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256 - NUMCOLORS + i] = colors[i];
    }
}

// initialize the player
void initPlayer() {
    player.x = 100;
    player.y = 123;
    player.oldX = player.x;
    player.oldY = player.y;
    player.xVelocity = 0;
    player.yVelocity = 0;
    player.width = 36;
    player.height = 36;
    player.lives = 1;
    player.iframes = 0;
    player.dodge = 0;
    player.fired = 0;
    player.speed = 2;
}

// initialize each asteroid
void initAsteroids() {
    for (int i = 0; i < ASTEROIDCOUNT; i++) {
        asteroids[i].x = 0;
        asteroids[i].y = 0;
        asteroids[i].oldX = asteroids[i].x;
        asteroids[i].oldY = asteroids[i].y;
        asteroids[i].xVelocity = 0;
        asteroids[i].yVelocity = 0;
        asteroids[i].width = 10;
        asteroids[i].height = 10;
        asteroids[i].active = 0;
    }
}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < ASTEROIDCOUNT; i++) {
        updateAsteroids(&asteroids[i]);
        if (asteroids[i].active) {
        }
    }

    // dynamic difficulty adjustment that increases difficulty over time
    if (time < 600) {
        if (time % 90 == 0) {
            newAsteroid();
            if (rand() % 3) {
                newAsteroid();
            }
        }
    } else if (time >= 600 && time < 1200) {
        if (time % 75 == 0) {
            newAsteroid();
            newAsteroid();
            if (rand() % 3) {
                newAsteroid();
                newAsteroid();
            }
        }
    } else if (time >= 1200 && time < 1800) {
        if (time % 60 == 0) {
            newAsteroid();
            newAsteroid();
            if (rand() % 3) {
                newAsteroid();
                newAsteroid();
            }
        }
    } else if (time >= 1800 && time < 2400) {
        if (time % 45 == 0) {
            newAsteroid();
            newAsteroid();
            if (rand() % 3) {
                newAsteroid();
            }
        }
    } else if (time >= 2400 && time < 3000) {
        if (time % 30 == 0) {
            newAsteroid();
            if (rand() % 3) {
                newAsteroid();
                newAsteroid();
            }
        }
    }  else if (time >= 3000) {
        if (time % 15 == 0) {
            newAsteroid();
            if (rand() % 3) {
                newAsteroid();
                newAsteroid();
            }
        }
    }
}

void updatePlayer() {
    // update the player lives to check if to end game
    lives = player.lives;

    // if player has dodged, continue the cooldown timer
    if (player.dodge && dodgeTime < 180) {
        // if 1 second has passed, take away their dodge invulnerability
        if (dodgeTime >= 60) {
            player.iframes = 0;
            player.speed = 2;
        }
        dodgeTime++;
    } else {
        // otherwise, reset the cooldown after 3 seconds
        player.dodge = 0;
        dodgeTime = 0;
    }

    // player movement left and right
    if (BUTTON_HELD(BUTTON_LEFT) && (player.x - player.speed > -1)) {
        player.x -= player.speed;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width + 1 < SCREENWIDTH)) {
        player.x += player.speed;
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        // score += 1000;
    }

    // dodge button that checks if the right button is pressed and that the player is not on cooldown
    if ((BUTTON_PRESSED(BUTTON_LSHOULDER) || BUTTON_PRESSED(BUTTON_RSHOULDER)) && !player.dodge) {
        player.dodge = 1;
        player.iframes = 1;
        player.speed = 4;

        // play a sound to represent the dodge
        REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(2);
        REG_SND2FREQ = NOTE_D3 | SND_RESET;
    }

    // for playtesting purposes, activate invulnerability so you can test the end screen
    if (BUTTON_PRESSED(BUTTON_B)) {
        player.iframes = 1;
    }
}

void updateAsteroids(ASTEROID* a) {
    if (a->active) {
        // collision check, which takes the player's middle hitbox so that wing and near hits don't count
        if (collision(a->x, a->y, a->width, a->height, player.x + 13, player.y, 9, player.height)) {
            if (!player.iframes) {
                // if player isn't dodging, they lose a life
                player.lives -= 1;
                lives = player.lives;

                // play a low explosion sound
                REG_SND4CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(6);
                REG_SND4FREQ = NOTE_C5 | SND_RESET;
            }
        }
        // set asteroid to inactive if they touch bottom of screen, otherwise keep sending them down
        if (a->y + a->height + 3 >= 160) {
            a->active = 0;
        } else {
            a->y += 3;
        }
    }
}

// activate a new asteroid at a random x position
void newAsteroid() {
    for (int i = 0; i < ASTEROIDCOUNT; i++) {
        if (!asteroids[i].active) {
            asteroids[i].x = rand() % 230;
            asteroids[i].y = 11;
            asteroids[i].active = 1;
            asteroids[i].erased = 0;
            break;
        }
    }
}

void drawGame() {
    // draw the UI and background
    drawRect4(0, 0, 240, 11, GRAYID);
    drawRect4(0, 11, 240, 150, 0);

    // check abilities
    if (!player.fired) {
        // drawRect4(220, 3, 5, 5, REDID);
    }

    // if player can dodge, draw the icon
    if (!player.dodge) {
        drawRect4(227, 3, 5, 5, WHITEID);
    }

    drawPlayer();
    for (int i = 0; i < ASTEROIDCOUNT; i++) {
        drawAsteroids(&asteroids[i]);
    }
}

// draw a different bitmapbased on whether or not player is dodging
void drawPlayer() {
    if (player.iframes) {
        // DMANow(3, dodgePal, PALETTE, 240);

        // for (int i = 0; i < NUMCOLORS; i++) {
        //     PALETTE[256 - NUMCOLORS + i] = colors[i];
        // }
        drawImage4(player.x, player.y, player.width, player.height, dodgeBitmap);
    } else {
        // DMANow(3, shipProtoPal, PALETTE, 240);

        // for (int i = 0; i < NUMCOLORS; i++) {
        //     PALETTE[256 - NUMCOLORS + i] = colors[i];
        // }
        drawImage4(player.x, player.y, player.width, player.height, shipProtoBitmap);
    }
}

void drawAsteroids(ASTEROID* a) {
    if (a->active) {
        drawRect4(a->x, a->y, a->width, a->height, BROWNID);
    } else if (!a->erased) {
        a->erased = 1;
    }
}