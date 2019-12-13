void _gif() {
  background(255);

  if (isGifCreated == false) {
    gif_ui = loadImage("ui/gif_ui.png");
    capturedTime = millis()/1000;
    photo1 = loadImage("photo" + (photoCount - 1) + ".png");
    photo2 = loadImage("photo" + photoCount + ".png");
    isGifCreated = true;
  }
  image(gif_ui, 0, 0, 1920, 1080);

  int timeLimit = 3;
  int nowTime = millis()/1000;
  int elapsedTime = nowTime - capturedTime;
  gifCountDown = timeLimit - elapsedTime;

  if (gifCountDown == 0) {
    mode = 5;
  }



  count = count + 1;
  if (count >= 4) {
    count = 0;
  }

  // カウントを floor() で切り捨てしてフレーム番号を計算
  int f = floor(count);

  // フレーム番号に応じて画像を出し分ける
  if (f == 0) {
    image(photo1, 320, 180, 1280, 720);
  } else if (f == 1) {
    image(photo2, 320, 180, 1280, 720);
  } else if (f == 2) {
    image(photo1, 320, 180, 1280, 720);
  } else if (f == 3) {
    image(photo2, 320, 180, 1280, 720);
  }
}
