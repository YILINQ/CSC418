// Add (hard code) an orbiting (point or directional) light to the scene. Light
// the scene using the Blinn-Phong Lighting Model.
//
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
uniform bool is_luna;
uniform bool is_mirana;
uniform bool is_lina;
uniform bool is_motrai;
uniform bool is_lanaya;
// Inputs:
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
out vec3 color;
// expects: PI, blinn_phong
void main()
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  vec3 ka = vec3(0.01, 0.02, 0.15);
  vec3 kd = vec3(0.2, 0.3, 0.8);
  vec3 ks = vec3(0.8,0.8,0.8);
  vec4 view_direction = view * view_pos_fs_in;

  float light_theta = animation_seconds * M_PI / 2;
  mat4 rotation = mat4(cos(light_theta), 0, sin(light_theta), 0,
   0, 1.0, 0, 0,
   -sin(light_theta), 0, cos(light_theta), 0,
   0, 0, 0, 1.0);

  if (is_moon) {
    ka = vec3(0.03, 0.03, 0.03);
    kd = vec3(0.5, 0.5, 0.5);
    ks = vec3(0.8,0.8,0.8);
  }
  if (is_luna) {
    ka = vec3(0.03, 0.03, 0.03);
    kd = vec3(0.3, 0.3, 0.8);
    ks = vec3(0.8,0.8,0.8);
  }
  if (is_mirana) {
    ka = vec3(0.03, 0.03, 0.03);
    kd = vec3(0.35, 0.05, 0.35);
    ks = vec3(0.8,0.8,0.8);
  }
  if (is_lina) {
    ka = vec3(0.03, 0.03, 0.03);
    kd = vec3(0.9, 0.15, 0.25);
    ks = vec3(0.8,0.8,0.8);
  }
    if (is_lanaya) {
    ka = vec3(0.03, 0.03, 0.03);
    kd = vec3(0.1, 0.1, 0.2);
    ks = vec3(0.8,0.8,0.8);
  }
    if (is_motrai) {
    ka = vec3(0.03, 0.03, 0.03);
    kd = vec3(0.29, 0.95, 0.025);
    ks = vec3(0.8,0.8,0.8);
  }
  float p = 888;
  vec3 l = ((view * vec4(1, 1, 1, 0))).xyz;
  vec3 v = ((view_direction).xyz);
  color = blinn_phong(ka, kd, ks, p, normal_fs_in, v, l);
  /////////////////////////////////////////////////////////////////////////////
}
