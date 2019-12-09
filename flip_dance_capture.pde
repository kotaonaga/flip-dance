import processing.video.*;

Capture cam;
int mode = 0;
boolean isCamOn = false;

void setup() {
  size(800, 500);
}

void draw() {
  if (mode == 1) _start();
  if (mode == 2) _select();
  if (mode == 3) _ready();
  if (mode == 4) _photo1();
  if (mode == 5) _photo2();
  if (mode == 6) _end();
  if (mode == 7) _send();
  println(mode);
}

void _start() {
  background(255);
  fill(0);
  text("遊び方", 0, 100);

  fill(0);
  text("①踊り方を選ぶ", 0, 150);

  fill(0);
  text("②写真を2〜3枚とる", 0, 200);

  fill(0);
  text("③踊っているあなたがダンスフロアへ！", 0, 250);
}

void _select() {
  background(255);
  fill(0);
  text("どう踊る？", 0, 100);
}

void _ready() {
  background(255);
  fill(0);
  text("テキトーに踊る", 0, 100);

  background(255);
  fill(0);
  text("写真を取られる準備ができたらボタンを押して足下のマークにたってね", 0, 100);
}

void _photo1() {

  if (isCamOn == false) {
    cam = new Capture(this, width, height, "FaceTime HD Camera");
    cam.start();
    isCamOn = true;
  }

  if (cam.available()) {
    cam.read();
  }

  pushMatrix();
  scale(-1, 1);
  image(cam, -cam.width, 0);
  popMatrix();
}
void _photo2() {
}
void _end() {
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
