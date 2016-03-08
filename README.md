# Normal Map Generator
Project for CPSC 451 Digital Image Processing at UNBC

Matlab script to take an image and generate a square normal map used in 3D graphics to fake detail on a surface.
### Description

The purpose of a normal map is to extract detail, like bumps or divots, from an image intended to be used as a texture over a 3D model. This means that some sort of height information needs to be extracted for each pixel in the source image. To do this, sobel edge detection is done on a grayscale version of the source image where pixel values range from 0.0 (black) to 1.0 (white). In our case a pixel with 0.5 would mean that the pixel is on the surface the source image represents. Values above 0.5 mean they are raised from the surface, while values under 0.5 are divots into the surface.

In the edge detection process we end up with two values for a pixel: the change in intensity in the X direction and the change in intensity in the Y direction. The cross product of these values is taken for each pixel giving a vector perpendicular to that pixel, which is the normal vector. The normal vector is then scaled from values between [-1.0, 1.0] to values in RGB [0,255]. In the normal vector, X corresponds to the red channel, Y to the green channel and Z to the blue channel. These color values indicate how a pixel changes the value of light in relation to the direction the light is hitting the surface.

### Example
<img src="http://i.imgur.com/WK9gKr7.jpg" width=500> <br>
Left: Original Image
Right: Generated Normal Map

<img src="http://i.imgur.com/5qd3p8u.jpg" width=550> <br>
Left: Surface without Normal Map
Right: Surface with Normal Map
