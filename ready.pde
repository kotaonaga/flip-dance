void _ready() {
  background(255);

  if (mouseX > 1200 && mouseX < 1680 &&
    mouseY > 735 && mouseY < 865) {
    isCursorOn = true;
  } else {
    isCursorOn = false;
  }

  night_club();
  if (isMovieOn ==false) {

    ready_button = loadImage("ready_button.png");
    ready_button_on = loadImage("ready_button_on.png");
    movie = new Movie(this, "instruction.MOV");
    isMovieOn = true;
  }
  movie.loop();
  PImage ready_ui = loadImage("ui/ready_ui.png");
  image(ready_ui, halfWidth, 0);
  image(movie, 1120, 350, 640, 360);

  if (isMovieOn) {
    if (isCursorOn) {
      image(ready_button_on, 1220, 770);
    } else {
      image(ready_button, 1220, 770);
    }
  }
}

void movieEvent(Movie m) {
  m.read();
}
