
Flower f1 = new Flower();  // By definition, an object based on the Flower class should exist.


void setup() { 
  
  size(900, 600); // Define canvas size
  f1.Values(); // Initialize the variables needed for the Flower class
}

void draw() { //

  background(#437F76); // Set color of, and continually update, the background color.
  f1.Refresh(); // Continually refresh the functionality inherent to the Flower class, to allow for movement and boundary detection as well refreshing visuals.
}

class Flower { // Declare the class Flower

  Flower () { // Empty constructor. Unneccessary? Probably.
  
  }

  
  float ballX; // Intial location for spawning the Flower on the x-axis
  float ballY; // Initial location for spawning the Flower on the y-axis
  float moveX; // Variable controlling movement of the flower on the x-axis
  float moveY; // Variable controlling movement of the flower on the y-axis
  float miscX; // Variable controlling the placement of the petals on the x-axis.
  float miscY; // Variable controlling the placement of the petals on the y-axis
  int r=70; // Variable defining the radius of the base ellipses.

  void Values() {  // Giving the (initial) values of the above variables.
    ballX = width/2; // By dividing width by 2, places the initial Flower in the center x-axis location of the screen.
    ballY = height/2; // By dividing height by 2, places the initial Flower in the center y-axis location of the screen.
    moveX = -1.5; // Setting initial movement value (thus, speed) for the Flower on the x-axis.
    moveY = -1.5; // Setting initial movement value for the Flower on the y-axis.
  }


  void Refresh() { // Function which both updates all the relevant movement and boundary calculations of the Flower class, and does the job of "drawing" the Flower and all inhereted petals continually.
    if ((r*1.5) + ballX >= width || ballX-(r*1.5) <= 1) {  // If statement which checks the boundary of the Flower on the x-axis.
    // Achieved by; multiplying the radius by 1.5 (to cover the combined width of flower-from-center plus the diameter of the petals) added to the current x-axis location of the flower comes to more or exactly the width OR is less or equal to 1.
      moveX = (moveX * (-1)); // If the above is true, multiple the current moveX value by negative 1, thus flipping the current travel path on the x-axis in reverse, stopping any boundary crossing.
    } 

    if ((r*1.5) + ballY >= height || ballY-(r*1.5) <= 1) {  // Exact same functionality as above, this one covering the movement on the y-axis.
      moveY = (moveY * (-1));  
    }

    ballY += moveY; // Combining the current ballY with the updated to moveY to facilitate movement of the y-axis.
    ballX += moveX; // As above, only for the x-axis.

    fill(#FFA005);  // Giving color to the shapes defined herafter, the petals.
    for (float i=0; i<PI*2; i+=2*PI/8) { // for-function controlling the placement of the petals surrounding the flower-center, here modified to have an attractive number of 8.
      miscX = ballX + r*cos(i); // Giving value to the miscX variable, controlling the placement of petals.
      miscY = ballY + r*sin(i); // As above, for miscY
      ellipse(miscX, miscY, r, r); // Drawing the petals, as based on the above calculations inherent in miscX and Y variables.
    }
    fill(200, 0, 0); // Giving color to the shape defined herafter, the flower-center.
    ellipse(ballX, ballY, r*1.2, r*1.2); // Drawing the flower-center, with a slightly larger radius than the default by multiplying the standard r value by 1.2.
  }
}
