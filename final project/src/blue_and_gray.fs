// Set the pixel color to blue or gray depending on is_moon.
//
// Uniforms:
uniform bool is_moon;
uniform bool is_luna;
uniform bool is_mirana;
uniform bool is_lina;
uniform bool is_lanaya;
uniform bool is_motrai;

// Outputs:
out vec3 color;
void main()
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code:
  if (is_moon){
   color = vec3(0.9,0.5,0.1);
  }
  else if(is_luna){
   color = vec3(0,0.5,0.7);
  }
  else if(is_mirana){
  	color = vec3(1, 0, 1);
  }
  else if (is_lina){
  	color = vec3(1, 0.2, 0);
  }
  else if(is_lanaya){
  	color = vec3(0.5, 0, 0.9);
  }
  else if(is_motrai){
  	color = vec3(0.7, 1, 0.3);
  }
  /////////////////////////////////////////////////////////////////////////////
}
