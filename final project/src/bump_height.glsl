// Create a bumpy surface by using procedural noise to generate a height (
// displacement in normal direction).
//
// Inputs:
//   is_moon  whether we're looking at the moon or centre planet
//   s  3D position of seed for noise generation
// Returns elevation adjust along normal (values between -0.1 and 0.1 are
//   reasonable.
float bump_height(bool is_moon, vec3 s)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  float noise;
  vec3 f = vec3(2, 10, 3);
  vec3 a = vec3(300, 10, 100);
  a = a / (a.x + a.y + a.z);
  if (is_moon) {
    // for moon
    // this is modified from Perlin's paper
  	f = vec3(1, 0, 0);
    float sum = 0;
    float size = 0.9;
    float scale = size;
    while (scale >= 0.128) {
      sum += improved_perlin_noise(s / scale);
      scale /= 2.0;
  }
  float noise = 0.5 + 0.2 * sin(4 * M_PI * (s.x + 2 * sum));
  noise = (noise * noise - 0.5) * 0.01;
  return noise;
  }
  
  noise = a.x * improved_perlin_noise(s * f.x) + a.y * improved_perlin_noise(s * f.y) + a.z * improved_perlin_noise(s * f.z);
  //noise = abs(sin((noise * M_PI)));
  float height = smooth_heaviside(noise + 0.5, 35)*0.1;
  // ------------------
  // this part is to add another bump map to the original surface
  // uncomment to create a more turbulance surface

  // if (height >= 0.08){
  //   f = vec3(1, 9, 7);
  //   a = vec3(0.1, .1, 0.1);
  //   a = a / (a.x + a.y + a.z);
  //   noise = a.x * improved_perlin_noise(s * f.x) + a.y * improved_perlin_noise(s * f.y) + a.z * improved_perlin_noise(s * f.z);

  //   height += abs(noise);
  // }

  // this part is to add another bump map to the original surface
  // uncomment to create a more turbulance surface
  // ------------------
  return height;
  /////////////////////////////////////////////////////////////////////////////
}
