void _capture() {
  background(255);
  PImage captureImg = loadImage("capture.png");
  image(captureImg, 0, 0);
  if (isCamOn == false) {
    count1 = loadImage("1.png");
    count2 = loadImage("2.png");
    count3 = loadImage("3.png");
    if (danceMode == 1) {
      int exNum = exRandom[(int) random(7)];
      ex1 = loadImage("flip_dance_ex/ex" + exNum +".jpeg");
      ex2 = loadImage("flip_dance_ex/ex" + (exNum + 1) + ".jpeg");
    }
    cam = new Capture(this, halfWidth, halfHeight, "FaceTime HD Camera");
    cam.start();
    isCamOn = true;
    //println(exNum);
    //println(exNum + 1);
  }

  if (isClicked == false) {
    clickedTime = millis()/1000;
    isClicked = true;
  }

  int timeLimit = 7;
  int nowTime = millis()/1000;
  int elapsedTime = nowTime - clickedTime;
  countDown = timeLimit - elapsedTime;

  //カメラを表示

  if (cam.available()) {
    cam.read();
  }

  pushMatrix();
  scale(-1, 1);
  image(cam, -cam.width * 2, 290);
  popMatrix();

  //お手本画像を表示
  if (danceMode == 1)image(ex1, 0, 290, halfWidth, halfHeight);
  if (danceMode == 2) image(ex2, 0, 290, halfWidth, halfHeight);


  if (countDown > 0) {
    imageMode(CENTER);
    if (countDown == 3) {
      image(count3, width/2, height/2);
    } else if (countDown == 2) {
      image(count2, width/2, height/2);
    } else if (countDown == 1) {
      image(count1, width/2, height/2);
    }
  }
  imageMode(CORNER);

  if (countDown == 0) {
    if (isPhoto1Taken == false && danceMode == 1) {
      player.play(0);
      save("/Users/kota/Documents/Processing/flip_dance_capture/data/temp_photo1.png");
      PImage photo1 = loadImage("temp_photo1.png");
      PImage cropedPhoto1 = photo1.get(width/2, 290, 960, 540);
      photoCount++;
      cropedPhoto1.save("/Users/kota/Documents/Processing/flip_dance_capture/data/photo" + photoCount + ".png");
      isPhoto1Taken = true;
    }

    if (isPhoto2Taken == false && danceMode == 2) {
      player.play(0);
      save("/Users/kota/Documents/Processing/flip_dance_capture/data/temp_photo2.png");
      PImage photo2 = loadImage("temp_photo2.png");
      PImage cropedPhoto2 = photo2.get(width/2, 290, 960, 540);
      photoCount++;
      cropedPhoto2.save("/Users/kota/Documents/Processing/flip_dance_capture/data/photo" + photoCount + ".png");
      isPhoto2Taken = true;
    } else {
    }

    background(255);
  }

  if (countDown < -1) {
    countDown = 0;
    isCamOn = false;
    isClicked = false;
    if (isPhoto1Taken == true && isPhoto2Taken == false) {
      mode = 6;
      danceMode = 2;
    }

    if (isPhoto1Taken == true && isPhoto2Taken == true) {
      //gif画面に遷移
      mode = 4;
    }
  }
}
