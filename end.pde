void _end() {
  background(255);
  
  if (isEnd == false) {
    capturedTime = millis()/1000;
    end_ui = loadImage("ui/end_ui.png");
    //photo1 = loadImage("photo" + (photoCount - 1) + ".png");
    //photo2 = loadImage("photo" + (photoCount) + ".png");
    isEnd = true;
  }
  image(end_ui, width/2, 0);
  
  int timeLimit = 6;
  int nowTime = millis()/1000;
  int elapsedTime = nowTime - capturedTime;
  endCountDown = timeLimit - elapsedTime;

  if (endCountDown == 0) {
    mode = 1;
    init();
  }
  
  if (isPhoto1Taken) photo1 = loadImage("photo" + (photoCount - 1) + ".png");
  if (isPhoto1Taken) photo2 = loadImage("photo" + photoCount + ".png");
  night_club();

  count = count + 0.5;
  if (count >= 4) {
    count = 0;
  }

  // カウントを floor() で切り捨てしてフレーム番号を計算
  int f = floor(count);

  // フレーム番号に応じて画像を出し分ける
  if (f == 0) {
    image(photo1, 1056, 395, width/2.5, height/2.5);
  } else if (f == 1) {
    image(photo2, 1056, 395, width/2.5, height/2.5);
  } else if (f == 2) {
    image(photo1, 1056, 395, width/2.5, height/2.5);
  } else if (f == 3) {
    image(photo2, 1056, 395, width/2.5, height/2.5);
  }
  println(f);
}
