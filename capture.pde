void _capture() {
  
  if (isCamOn == false) {
    cam = new Capture(this, imageWidth, imageHeight, "FaceTime HD Camera");
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
  
  //カメラを表示
  if (cam.available()) {
    cam.read();
  }
  
  pushMatrix();
  scale(-1, 1);
  image(cam, -cam.width * 2, height/2);
  popMatrix();

  //お手本画像を表示
  PImage easy1 = loadImage("dance1.jpeg");
  PImage easy2 = loadImage("dance2.jpeg");
  if(danceMode == 1)image(easy1, 0, height/2, imageWidth, imageHeight);
  if(danceMode == 2) image(easy2, 0, height/2, imageWidth, imageHeight);
  
  
  if (countDown > 0) {
    if (countDown <= 10) {
    }
    text(countDown, 20, 40);
  } else {
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

    if (danceMode == 2 && isPhoto2Taken == true) {
      PImage img = loadImage("photo2.png");
      image(img, 0, 0);
    }
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
