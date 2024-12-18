// Declare variables for the primary lightning bolt
int startX, startY, endX, endY;

// Additional feature: Number of lightning strikes
int lightningCount = 3; // Number of simultaneous bolts

void setup() {
  // Set up the canvas size, stroke weight, and background
  size(500, 300);   // Canvas size
  strokeWeight(2);  // Thickness of the lightning
  background(0);    // Black background (night sky)
}

void draw() {
  // Lightning is triggered only when the mouse is pressed
  if (mousePressed) {
    for (int i = 0; i < lightningCount; i++) {
      // For each bolt, reset to initial values
      startX = 0;       // Start at the left side of the screen
      startY = 150;     // Initial Y position in the middle
      endX = 0;
      endY = 150;

      // Create a lightning bolt (random walk)
      while (endX < width) { // Repeat until the bolt reaches the right edge
        stroke((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256)); // Random color
        endX = startX + (int)(Math.random() * 10);            // Move right by 0-9 pixels
        endY = startY + (int)(Math.random() * 19) - 9;        // Move up or down by -9 to 9 pixels
        line(startX, startY, endX, endY);                     // Draw the segment
        startX = endX;                                        // Update startX for next segment
        startY = endY;                                        // Update startY for next segment
      }
    }
  }
}

void mousePressed() {
  // Reset the screen when the mouse is pressed
  background(0); // Black background for the next set of bolts
}
