import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.sound.*;
import processing.video.*;

//スタート
PImage start_ui;
boolean isStartOn;

//ビデオ系
Movie movie;
boolean isMovieOn = false;
PImage start_button;
PImage start_button_on;

//状態遷移
int mode = 1;
int danceMode = 1;

//カーソル系
boolean isCursorOn;

//カメラ系
Capture cam;
boolean isCamOn = false;
boolean isPhoto1Taken = false;
boolean isPhoto2Taken = false;
int[] exRandom = {1, 3, 5, 7, 9, 11, 13, 15};

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
boolean afterCamOn = false;
PImage afterCam_ui;

//gif系
int gifCountDown;
boolean isGifCreated;
PImage gif_ui;

//end系
boolean isEnd;
int endCountDown;
int posCount;
PImage end_ui;

//お手本画像
PImage ex1;
PImage ex2;

//ready系
PImage ready_button;
PImage ready_button_on;

//パラパラ漫画系(画像を含む)
float count;
int photoCount = 0;
PImage photo1;
PImage photo2;

//画像半分サイズ
int halfWidth = 1920 / 2; //960
int halfHeight = 1080 /2; //540

//ボタン系
boolean isPushed = false;

//ナイトクラブ
PImage nightClub;
boolean isClubOn = false;
int rx[] = new int[10000];
int ry[] = new int[10000];

//Minim系
Minim minim;
AudioPlayer player;
AudioPlayer danceMusicPlayer;

//数値系
PImage count1;
PImage count2;
PImage count3;

void setup() {
  cursor(HAND);
  //size(1920, 1080);//半分サイズは400, 250 1920と1080。半分は960と540。
  size(960, 540);
  //surface.setLocation(-width, -700);
  //fullScreen(2); //本番用

  minim = new Minim(this);  //初期化
  player = minim.loadFile("camera-shutter1.mp3");  //sample.mp3をロードする
  danceMusicPlayer = minim.loadFile("dancing_music1.mp3");
}

void draw() {
  if (mode == 1) _start();
  if (mode == 2) _ready();
  if (mode == 3) _capture();
  if (mode == 4) _gif();
  if (mode == 5) _end();
  if (mode == 6) _afterCam();
}

//テスト用
void keyPressed() {
  if (key == '1') mode = 1;
  if (key == '2') mode = 2;
  if (key == '3') mode = 3;
  if (key == '4') mode = 4;
  if (key == '5') mode = 5;
  if (key == '6') mode = 6;
}

//ボタンの領域判定
void mouseClicked() {
  if (mode == 1 &&
    mouseX > 1200 && mouseX < 1680 &&
    mouseY > 735 && mouseY < 865) 
  {
    mode = 2;
  } else if (mode == 2 &&
    mouseX > 1200 && mouseX < 1680 &&
    mouseY > 735 && mouseY < 865) {
    mode = 3;
  }
}
