#include "gba.h"
#include "mode4.h"
#include "print.h"
#include "space.h"
#include "game.h"
#include <stdio.h>
#include "sound.h"

unsigned short oldButtons;
unsigned short buttons;

void initialize();
void goToStart();
void start();
void goToScore();
void scoreScreen();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

char buffer[41];
char highBuffer[41];

enum {
    START,
    SCORE,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

int rSeed;

int main() {
    mgba_open();
    mgba_printf("Debug Log Initialized!");

    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        while (1) {
            oldButtons = buttons;
            buttons = REG_BUTTONS;

            switch (state) {
                case START:
                    start();
                    break;
                case SCORE:
                    scoreScreen();
                    break;
                case GAME:
                    game();
                    break;
                case PAUSE:
                    pause();
                    break;
                case WIN:
                    win();
                    break;
                case LOSE:
                    lose();
                    break;
            }
        }
    }
}

void initialize() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;

    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    time = 0;

    goToStart();
}

void goToStart() {
    // Set palette and draw fullscreen image
    DMANow(3, spacePal, PALETTE, 256);
    PALETTE[255] = WHITE;
    drawFullscreenImage4(spaceBitmap);
    drawString4(66, 76, "STARDUST CRUSADERS", 255);
    drawString4(59, 91, "Press Enter to Start", 255);
    waitForVBlank();
    flipPage();

    state = START;
    rSeed = 0;
}

void start() {
    rSeed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        time = 0;
        srand(rSeed);
        goToGame();
        initGame();
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        goToScore();
    }
}

void goToScore() {
    mgba_printf("wahwa");
    drawFullscreenImage4(spaceBitmap);
    sprintf(buffer, "%d", score);
    drawString4(66, 76, "Current Highscore:", 255);
    drawString4(75, 91, buffer, 255);
    waitForVBlank();
    flipPage();
    state = SCORE;
}

void scoreScreen() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToStart();
    }
}

void goToGame() {
    state = GAME;
}

void game() {
    updateGame();
    drawGame();

    // update the score
    drawString4(2, 2, "SCORE: ", YELLOWID);
    sprintf(buffer, "%d", score);
    drawString4(40, 2, buffer, YELLOWID);
    waitForVBlank();
    flipPage();
    time++;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (time % 60 == 0) {
        mgba_printf("time: %d", time);
        score += 100;
        if (time >= 7200) { //replace with 3600 for standard time
            goToWin();
        }
    }

    if (lives == 0) {
        goToLose();
    }
}

void goToPause() {
    drawString4(102, 2, "PAUSED", YELLOWID);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        drawRect4(200, 2, 36, 8, GRAYID);
        state = GAME;
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin() {
    if (score > highscore) {
        highscore = score;
    }

    sprintf(buffer, "%d", score);
    sprintf(highBuffer, "%d", highscore);

    DMANow(3, spacePal, PALETTE, 256);
    PALETTE[255] = WHITE;
    PALETTE[254] = GREEN;
    drawFullscreenImage4(spaceBitmap);
    drawString4(66, 76, "YOU WIN! Your score: ", 254);
    drawString4(200, 76, buffer, 254);
    drawString4(66, 91, "Highscore: ", 255);
    drawString4(200, 91, highBuffer, 255);
    waitForVBlank();
    flipPage();

    state = WIN;
}

void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    if (score > highscore) {
        highscore = score;
    }

    sprintf(buffer, "%d", score);
    sprintf(highBuffer, "%d", highscore);

    DMANow(3, spacePal, PALETTE, 256);
    PALETTE[255] = WHITE;
    PALETTE[254] = RED;
    drawFullscreenImage4(spaceBitmap);
    drawString4(66, 76, "YOU LOSE! Your score: ", 254);
    drawString4(200, 76, buffer, 254);
    drawString4(66, 91, "Highscore: ", 255);
    drawString4(200, 91, highBuffer, 255);
    waitForVBlank();
    flipPage();

    state = LOSE;
}

void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}