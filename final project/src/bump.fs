// Set the pixel color using Blinn-Phong shading (e.g., with constant blue and
// gray material color) with a bumpy texture.
// 
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
// Inputs:
//                     linearly interpolated from tessellation evaluation shader
//                     output
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
//               rgb color of this pixel
out vec3 color;
// expects: model, blinn_phong, bump_height, bump_position,
// improved_perlin_noise, tangent
vec3 normal_map(vec3 p){
	vec3 T, B;
	tangent(p, T, B);
	vec3 p1 = bump_position(is_moon, p);
	vec3 p2 = bump_position(is_moon, p + 0.0001*T);
	vec3 p3 = bump_position(is_moon, p + 0.0001*B);
	vec3 nn = normalize(cross((p2-p1) / 0.0001, (p3-p1) / 0.0001));

	if (dot(p, nn) <= 0){
		nn = -nn;
	}
	return nn;
}


void main()
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  vec3 ka;
  vec3 kd;
  vec3 ks = vec3(0, 0.5, 0.5);
  float p = 900;


 
  vec4 view_direction = view * view_pos_fs_in;
  

  float light_theta = animation_seconds * M_PI / 4;
  mat4 rotation = mat4(cos(light_theta), 0, sin(light_theta), 0,
   0, 1.0, 0, 0,
   -sin(light_theta), 0, cos(light_theta), 0,
   0, 0, 0, 1.0);

  vec3 l = ((view * rotation * vec4(1, 0, 0, 0))).xyz;
  vec3 v = view_direction.xyz;

  mat4 view_and_transform = view * model(is_moon, animation_seconds);
  vec3 normal = normalize((inverse(transpose(view_and_transform)) * vec4(normal_map(sphere_fs_in), 1.0)).xyz);

  ka = vec3(0.01, 0.02, 0.15);
  kd = vec3(0.2, 0.3, 0.8);
  ks = vec3(0.8,0.8,0.8);
  if(is_moon) {
    ka = vec3(0.03, 0.03, 0.03);
    kd = vec3(0.5, 0.5, 0.5);
    ks = vec3(0.8,0.8,0.8);
  }

  float noise = 0; 
  vec3 f = vec3(1, 1, 0);
  vec3 s = sphere_fs_in;
  noise = ((1 - 0.3) * improved_perlin_noise(s * f) + 0.3 * improved_perlin_noise(s * 10));
  ks *= 1*noise + 0.5;
  color = blinn_phong(ka, kd, ks, p, normal, v, l);
  /////////////////////////////////////////////////////////////////////////////
}
