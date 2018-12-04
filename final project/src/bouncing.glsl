// Construct the model transformation matrix. The moon should orbit around the
// origin. The other object should stay still.
//
// Inputs:
//   is_moon  whether we're considering the moon
//   time  seconds on animation clock
// Returns affine model transformation as 4x4 matrix
//
// expects: identity, rotate_about_y, translate, PI
mat4 bouncing(bool is_moon, float time)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 

  if (is_moon){
  	float theta =  M_PI * time / 2;
    float v = -1.0;
    float a = -0.1;
    if (time % 20 == 0){
      v *= -1;
      a *= -1;
    }
    v -= a*time;
    float s = v*time + 0.5*a*time*time;
  	mat4 shift = translate(vec3(0, s, 0));
  	mat4 model =  shift * uniform_scale(0.3);
  	return model;
  }
  else{
  	return identity();
  }
  /////////////////////////////////////////////////////////////////////////////
}
