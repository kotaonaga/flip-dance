void _end() {
  background(255);
  
  if(isPhoto1Taken) photo1 = loadImage("photo1.png");
  if(isPhoto1Taken) photo2 = loadImage("photo2.png");
  
  fill(0);
  text("できたよ\nこんな感じ！", 0, 200);

  count = count + 0.1;
  if (count >= 4) {
    count = 0;
  }

  // カウントを floor() で切り捨てしてフレーム番号を計算
  int f = floor(count);

  // フレーム番号に応じて画像を出し分ける
  if (f == 0) {
    image(photo1, 0, 0, 270, 180);
  } else if (f == 1) {
    image(photo2, 0, 0, 270, 180);
  } else if (f == 2) {
    image(photo1, 0, 0, 270, 180);
  } else if (f == 3) {
    image(photo2, 0, 0, 270, 180);
  }
}
