
PImage Image;
void setup() {
  int firstrun = 0;
  size(2400, 1800);
  Image = loadImage("Doggo.jpg");
  Image.filter(GRAY);
  draw(firstrun);
}

int index(int x, int y) {
  
  return x + y * Image.width;
  
}

void draw(int firstrun) {
  
  println("Firstrun = 1?");
  
  if (firstrun == 0){
    
    println("Firstrun = 0?");
  
  //Possible Colors = Level^3
  
  int Level = 6;
  Level = Level -1;
  
  Image.loadPixels();
  for (int y = 0; y < Image.height-1; y++) {
    for (int x = 1; x < Image.width-1; x++) {
      
      color pix = Image.pixels[index(x,y)];
      
      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      
      int newR = round(Level * oldR / 255) * (255/Level);
      int newG = round(Level * oldG / 255) * (255/Level);
      int newB = round(Level * oldB / 255) * (255/Level);
      
      Image.pixels[index(x,y)] = color(newR, newG, newB);
      
      firstrun = 1;
      
    }
  }
  Image.updatePixels();
  image(Image, 0, 0);
}
}

void keyPressed(){
  
  if (key == 'r'){
    selectFolder("Where Shall We Save The Image Master Wayne:", "folderSelected");
  }
}
  
void folderSelected(File selection){
  
   if (selection == null){
    return; 
   }
   else{
     String dir2 = selection.getPath() + "//";
     println("Saving To : " + dir2);
     save(dir2 + "Image.jpg");
   }
  
}
