//カメラで1枚目を撮った後の処理。
void _afterCam() {
  background(255);
  
  if(afterCamOn == false){
    afterCam_ui = loadImage("ui/afterCam.png");
    afterCamOn = true;
  }
  image(afterCam_ui, 0, 0);

  if (isCaptured == false) {
    capturedTime = millis()/1000;
    count1 = loadImage("1.png");
    count2 = loadImage("2.png");
    count3 = loadImage("3.png");
    isCaptured = true;
  }
  
  
  int timeLimit = 3;
  int nowTime = millis()/1000;
  int elapsedTime = nowTime - capturedTime;
  afterCountDown = timeLimit - elapsedTime;

  if (afterCountDown > 0) {
    imageMode(CENTER);
    if(afterCountDown == 3){
    image(count3, width/2, height/2);
    }else if(afterCountDown == 2){
    image(count2, width/2, height/2);
    }else if(afterCountDown == 1){
    image(count1, width/2, height/2);
    }
  }
  imageMode(CORNER);
  if (afterCountDown == 0) {
    mode = 3;
  }
  
}
