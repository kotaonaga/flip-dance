void night_club() {
  //音楽をProcessingで鳴らす際はこちらを使う。
  ////danceMusicPlayer.loop();
  ////player.loop();
  
  //if(danceMusicPlayer.isPlaying() == false){
  //  danceMusicPlayer.play(0);
  //}
  
  ////if(player.isPlaying() == false){
  ////  player.play(0);
  ////}

  PImage[] gifs = new PImage[10000];
  
  for(int i = 1; i <= photoCount; i++){
    gifs[i] = loadImage("photo" + i + ".png");
  }
  
  if (isClubOn == false) {
    
    nightClub = loadImage("fog_club.jpg");
    for (int i = 1; i < photoCount; i++) {
      rx[i] = (int) random(width/4);
      ry[i] = (int) random(height * 3/4);
      isClubOn = true;
    }
  }

  image(nightClub, 0, 0);

  count = count + 1;
  if (count >= 4) {
    count = 0;
  }

  int f = floor(count);
  
  for (int i = 1; i < photoCount; i++) {
    if (f == 0) {
      image(gifs[i], rx[i], ry[i], width/8, height/8);
    } else if (f == 1) {
      image(gifs[i + 1], rx[i], ry[i], width/8, height/8);
    } else if (f == 2) {
      image(gifs[i], rx[i], ry[i], width/8, height/8);
    } else if (f == 3) {
      image(gifs[i + 1], rx[i], ry[i], width/8, height/8);
    }
  }
}
