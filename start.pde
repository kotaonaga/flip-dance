void _start() {
  background(255);

  if (mouseX > 1200 && mouseX < 1680 &&
    mouseY > 735 && mouseY < 865) {
    isCursorOn = true;
  } else {
    isCursorOn = false;
  }

  if (isStartOn == false) {
    start_ui = loadImage("ui/start_ui.png");
    start_button = loadImage("start_button.png");
    start_button_on = loadImage("start_button_on.png");
    isStartOn = true;
  }


  image(start_ui, halfWidth, 0);

  if (isCursorOn) {
    image(start_button_on, 1220, 770);
  } else {
    image(start_button, 1220, 770);
  }
  night_club();
}
