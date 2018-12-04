// Given a 3d position as a seed, compute an even smoother procedural noise
// value. "Improving Noise" [Perlin 2002].
//
// Inputs:
//   st  3D seed
// Values between  -½ and ½ ?
//
// expects: random_direction, improved_smooth_step
float improved_perlin_noise( vec3 st) 
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  float x1 = floor(st.x);
  float x2 = floor(st.x);
  float x3 = floor(st.x);
  float x4 = floor(st.x);

  float y1 = floor(st.y);
  float y2 = floor(st.y);
  float y3 = y2 + 1;
  float y4 = y1 + 1;

  float z1 = floor(st.z);
  float z2 = floor(st.z) + 1;
  float z3 = z1;
  float z4 = z3 + 1;

  float x5 = x1 + 1;
  float x6 = x2 + 1;
  float x7 = x3 + 1;
  float x8 = x4 + 1;

  float y5 = y1;
  float y6 = y2;
  float y7 = y3;
  float y8 = y4;

  float z5 = z1;
  float z6 = z2;
  float z7 = z3;
  float z8 = z4;

  float x0 = st.x;
  float y0 = st.y;
  float z0 = st.z;


  vec3 g1 = (random_direction(vec3(x1, y1, z1)));
  vec3 g2 = (random_direction(vec3(x2, y2, z2)));
  vec3 g3 = (random_direction(vec3(x3, y3, z3)));
  vec3 g4 = (random_direction(vec3(x4, y4, z4)));
  vec3 g5 = (random_direction(vec3(x5, y5, z5)));
  vec3 g6 = (random_direction(vec3(x6, y6, z6)));
  vec3 g7 = (random_direction(vec3(x7, y7, z7)));
  vec3 g8 = (random_direction(vec3(x8, y8, z8)));

  float s1 = dot(g1, vec3(-x1 + x0, -y1 + y0, -z1 + z0));
  float s2 = dot(g2, vec3(-x2 + x0, -y2 + y0, -z2 + z0));
  float s3 = dot(g3, vec3(-x3 + x0, -y3 + y0, -z3 + z0));
  float s4 = dot(g4, vec3(-x4 + x0, -y4 + y0, -z4 + z0));
  float s5 = dot(g5, vec3(-x5 + x0, -y5 + y0, -z5 + z0));
  float s6 = dot(g6, vec3(-x6 + x0, -y6 + y0, -z6 + z0));
  float s7 = dot(g7, vec3(-x7 + x0, -y7 + y0, -z7 + z0));
  float s8 = dot(g8, vec3(-x8 + x0, -y8 + y0, -z8 + z0));

  vec3 f = improved_smooth_step(vec3(x0, y0, z0) - vec3(x1, y1, z1));
  float ix1_5 = f.x * (s5 - s1) + s1;
  float ix2_6 = f.x * (s6 - s2) + s2;
  float ix3_7 = f.x * (s7 - s3) + s3;
  float ix4_8 = f.x * (s8 - s4) + s4;

  float iy1 = f.y * (ix3_7 - ix1_5) + ix1_5;
  float iy2 = f.y * (ix4_8 - ix2_6) + ix2_6;

  float result = f.z * (iy2 - iy1) + iy1;

  return result * 2 / sqrt(3);
  /////////////////////////////////////////////////////////////////////////////
}

