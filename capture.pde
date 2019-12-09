void _capture() {

  if (isCamOn == false) {
    cam = new Capture(this, width, height, "FaceTime HD Camera");
    cam.start();
    isCamOn = true;
  }

  if (isClicked == false) {
    clickedTime = millis()/1000;
    isClicked = true;
  }

  int timeLimit = 2;
  int nowTime = millis()/1000;
  int elapsedTime = nowTime - clickedTime;
  countDown = timeLimit - elapsedTime;

  if (cam.available()) {
    cam.read();
  }

  pushMatrix();
  scale(-1, 1);
  image(cam, -cam.width, 0);
  popMatrix();


  if (countDown > 0) {
    if (countDown <= 10) {
    }
    text("COUNT DOWN : " + countDown, 20, 40);
  } else {
    text("TIME OVER", 20, 40);
  }

  if (countDown == 0) {
    if (isPhoto1Taken == false && danceMode == 1) {
      save("/Users/kota/Documents/Processing/flip_dance_capture/data/photo1.png");
      isPhoto1Taken = true;
    }

    if (isPhoto2Taken == false && danceMode == 2) {
      save("/Users/kota/Documents/Processing/flip_dance_capture/data/photo2.png");
      isPhoto2Taken = true;
    } else {
      println("danceModeが0です〜");
    }

    background(255);
  }

  if (countDown < 0) {
    if (danceMode == 1 && isPhoto2Taken == false) {
      PImage img = loadImage("photo1.png");
      image(img, 0, 0);
      fill(255);
      text("1枚目はこんな感じ！", 0, 200);
      //danceMode = 2;
    }

    //if (danceMode == 2 && isPhoto2Taken == true) {
    //  PImage img = loadImage("photo2.png");
    //  image(img, 0, 0);
    //}
  }

  if (countDown < -2) {
    countDown = 0;
    isCamOn = false;
    isClicked = false;
    if (isPhoto1Taken == true && isPhoto2Taken == false) {
      mode = 5;
      danceMode = 2;
    }

    if (isPhoto1Taken == true && isPhoto2Taken == true) {
      mode = 6;
    }
  }
}
