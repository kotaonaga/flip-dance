import processing.video.*;

// カメラ
Capture cam;

void setup() {
  size(800, 500);

  // カメラを初期化（おまじない。現時点で深い意味は考えなくてOK）
  cam = new Capture(this, width, height, "FaceTime HD Camera");
  cam.start();
  //println(cam.list());
}

void draw() {
  if (cam.available()) {
    cam.read();
  }

  background(0);

  pushMatrix();   // just so nothing else is affected
  scale(-1, 1);
  image(cam, -cam.width, 0);
  popMatrix();
}
