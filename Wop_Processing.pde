import processing.sound.*; // Import the Sound library

PImage kendrickStanding, kendrickPunching, drakeStanding, drakePunched;
PFont pixelFont;
int score = 0;
boolean isPunching = false;
SoundFile bgMusic;

// Define initial positions for Kendrick and Drake
float kendrickX, kendrickY, drakeX, drakeY;
float punchOffset = 20; // How much closer Kendrick gets when punching

void setup() {
  size(800, 600);
  background(0, 255, 255); // Cyan blue background

  // Full paths to the image files
  String basePath = "D:/Downloads backup1/Programming/Wop/";

  // Load sprites
  kendrickStanding = loadImage(basePath + "[removal.ai]_a2bc1511-25f6-4de6-98cf-e07d6a5e32ac-screenshot_4.png");
  kendrickPunching = loadImage(basePath + "download.png");
  drakeStanding = loadImage(basePath + "[removal.ai]_7ee54ae4-7d1c-4251-b1bd-2a789e96f1bf-screenshot_5.png");
  drakePunched = loadImage(basePath + "download (1).png");

  // Load pixel font
  pixelFont = createFont(basePath + "VCR_OSD_MONO_1.001.ttf", 48);

  // Load background music
  bgMusic = new SoundFile(this, basePath + "Not Like Us.mp3");
  bgMusic.loop(); // Play music in loop

  // Initialize positions to center the characters
  kendrickX = width / 2 - kendrickStanding.width;
  kendrickY = height / 2 - kendrickStanding.height / 2;
  drakeX = width / 2 + drakeStanding.width / 2;
  drakeY = height / 2 - drakeStanding.height / 2;
}

void draw() {
  background(0, 255, 255); // Cyan blue background

  // Display Kendrick sprite
  if (isPunching) {
    image(kendrickPunching, kendrickX + punchOffset, kendrickY);
  } else {
    image(kendrickStanding, kendrickX, kendrickY);
  }

  // Display Drake sprite
  if (isPunching) {
    image(drakePunched, drakeX, drakeY);
  } else {
    image(drakeStanding, drakeX, drakeY);
  }

  // Display score
  textFont(pixelFont);
  fill(0);
  text("Score: " + score, 10, 50);
}

void mousePressed() {
  // When the mouse is clicked, Kendrick punches Drake
  isPunching = true;
  score++;
}

void mouseReleased() {
  // Reset state after punch
  isPunching = false;
}
