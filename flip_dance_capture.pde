import processing.video.*;

//状態遷移
int mode = 1;
int danceMode = 1;

//カメラ系
Capture cam;
boolean isCamOn = false;
boolean isPhoto1Taken = false;
boolean isPhoto2Taken = false;

//カメラで撮った後の処理
boolean isCaptured = false;
int capturedTime = 0;

//タイマー系
int timeLimit = 5;
int countDown;
boolean isClicked = false;
int clickedTime = 0;

//afterCam系
int afterCountDown;


void setup() {
  size(800, 500);
  textSize(30);
  PFont font = createFont("MS Gothic", 30);
  textFont (font);
}

void draw() {
  if (mode == 1) _start();
  if (mode == 2) _select();
  if (mode == 3) _ready();
  if (mode == 4) _capture();
  if (mode == 5) _afterCam();
  if (mode == 6) _end();
  if (mode == 7) _send();
  println(mode);
  
}

void _photo2() {
  text("カメラ2回目撮るよ〜！", 0, 300);
}

void _send() {
}

void keyPressed() {
  if (key == '1') mode = 1;
  if (key == '2') mode = 2;
  if (key == '3') mode = 3;
  if (key == '4') mode = 4;
  if (key == '5') mode = 5;
  if (key == '6') mode = 6;
  if (key == '7') mode = 7;
  if (key == '8') mode = 8;
}
