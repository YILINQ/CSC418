// Generate a procedural planet and orbiting moon. Use layers of (improved)
// Perlin noise to generate planetary features such as vegetation, gaseous
// clouds, mountains, valleys, ice caps, rivers, oceans. Don't forget about the
// moon. Use `animation_seconds` in your noise input to create (periodic)
// temporal effects.
//
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
// Inputs:
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
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
  vec3 f = vec3(1, 1, 0);
  vec3 a = vec3(1, 1, 0);
  vec3 s = sphere_fs_in;

 
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

  if (!is_moon){
  	// continent or ocean
    float height = bump_height(is_moon, sphere_fs_in);
    // if (height >= 0.08){
    //     // to create a more turbulance surface
    //     f = vec3(1, 9, 7);
    //     a = vec3(0.1, .1, 0.1);
    //     a = a / (a.x + a.y + a.z);
    //     float noise = a.x * improved_perlin_noise(s * f.x) + a.y * improved_perlin_noise(s * f.y) + a.z * improved_perlin_noise(s * f.z);
    //     height += abs(noise);
    
  	if (height <= -.08 && abs(sphere_fs_in.y) / (animation_seconds - 2) <= 0.3 && animation_seconds > 2){
              // ocean
      ka = vec3(0.01, 0.02, 0.15);
      kd = vec3(0.2, 0.3, 0.8);
      ks = vec3(0.3,0.3,0.3);
  	}
  	else{

            // continent
      // changed based on lattitude

        ka = vec3(0.5*(1 - abs(sphere_fs_in.y)), 0.35, 0.1);
        kd = vec3(0.25*(1 - abs(sphere_fs_in.y)), 0.25, 0.2);
        ks = vec3(0.3, 0.3,0.3);

        //ka = vec3(0, 0.35, 0.1);
        //kd = vec3(0, 0.25, 0.2);
  	}
  }

  else {
    ka = vec3(0.03, 0.03, 0.03);
    kd = vec3(0.5, 0.5, 0.5);
    ks = vec3(0.8,0.8,0.8);
  }

  float noise = 0; 
  f = vec3(1, 1, 0);
  noise = abs(sin((1 - 0.3) * improved_perlin_noise(s * f) + 0.3 * improved_perlin_noise(s * 10)));
  //ks *= 10*noise;
  //kd= vec3(kd.x*noise, kd.y*5*noise, kd.z*(1 - noise));

  if(is_moon){
  	color = blinn_phong(ka, kd, ks, p, normal, v, l);
  }
  else{
  	// need to add the effect of cloud
    vec3 c = blinn_phong(ka, kd, ks, p, normal, v, l);
    float cloud_alpha = 0.5;
    f = vec3(1, 6, 0.5);
    float animation_control = min(max(animation_seconds-6, 0), 1);
    vec3 cloud_color = vec3(1, 1, 1);
    vec3 s = vec3(sphere_fs_in.x + animation_seconds * 0.3, sphere_fs_in.y, sphere_fs_in.z + animation_seconds);
    float noise = improved_perlin_noise(s * f);
    float w = (smooth_heaviside(noise+0.3, 12) + 1) * 0.5;
    float alpha = w * cloud_alpha * animation_control;
    color = cloud_color * alpha + (1 - alpha) * c;    
  }
  /////////////////////////////////////////////////////////////////////////////
}