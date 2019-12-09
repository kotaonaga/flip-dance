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


//お手本画像
PImage easy1;
PImage easy2;

//パラパラ漫画系
float count;
PImage photo1;
PImage photo2;
PImage photo3;
PImage photo4;
PImage photo5;
PImage photo6;

void setup() {
  size(800, 500);//半分サイズは400, 250
  textSize(30);
  PFont font = createFont("MS Gothic", 30);
  textFont (font);
  
  //テスト的にここに書いています。あとで消す。
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
