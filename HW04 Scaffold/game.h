// structs
typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    int lives;
    int iframes;
    int dodge;
    int fired;
    int speed;
} PLAYER;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    int active;
    int erased;
} ASTEROID;

// constants
#define ASTEROIDCOUNT 30

// variables
extern PLAYER player;
extern ASTEROID asteroids[ASTEROIDCOUNT];
extern int score;
extern int time;
extern int lives;
extern int highscore;

// custom game colors
#define NUMCOLORS 10
enum {BLACKID=(256-NUMCOLORS), WHITEID, GRAYID, REDID, GREENID, BLUEID, CYANID, MAGENTAID, YELLOWID, BROWNID};
extern unsigned short colors[NUMCOLORS];

// function prototypes
void initGame();
void initPlayer();
void initAsteroids();
void updateGame();
void updatePlayer();
void updateAsteroids();
void drawGame();
void drawPlayer();
void drawAsteroids();
