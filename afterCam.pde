void _afterCam() {
  background(255);
  fill(0);
  text("もう一枚撮るよ！", 0, 200);

  if (isCaptured == false) {
    capturedTime = millis()/1000;
    isCaptured = true;
  }

  int timeLimit = 3;
  int nowTime = millis()/1000;
  int elapsedTime = nowTime - capturedTime;
  afterCountDown = timeLimit - elapsedTime;

  if (afterCountDown > 0) {
    if (afterCountDown <= 10) {
    }
    text(afterCountDown, 20, 40);
  } else {
    //text("TIME OVER", 20, 40);
  }

  if (afterCountDown == 0) {
    mode = 4;
  }
}
