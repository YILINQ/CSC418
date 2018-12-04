// Construct the model transformation matrix. The moon should orbit around the
// origin. The other object should stay still.
//
// Inputs:
//   is_moon  whether we're considering the moon
//   time  seconds on animation clock
// Returns affine model transformation as 4x4 matrix
//
// expects: identity, rotate_about_y, rotate_about_x, translate, PI
mat4 model(bool is_moon, bool is_luna, bool is_mirana, bool is_lina,  bool is_lanaya, bool is_motrai, float time)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  float v0 = 4;
  float a = -2;
  float theta = M_PI * time / 2;
  float theta_SMH = M_PI * time / 4;
  float r = 3.0;
  float elastic_factor = 0.5;
  float elastic_hori = 3.0;

  mat4 rotate_x = mat4(
  1,0,0,0,
  0,cos(3*theta),sin(3*theta),0,
  0,-sin(3*theta),cos(3*theta),0,
  0,0,0,1);

  mat4 rotate_z = mat4(
  cos(theta),-sin(theta),0,0,
  sin(theta),cos(theta),0,0,
  0,0,1,0,
  0,0,0,1);


    
    // if (s > 2 || s < -2){
    //   s = 1 * time - 0.25*time*time;
    // }
    // else{
    //   float s = -1 * time + 0.25*time*time;
    // }
  if (is_moon){
  	


    
    
    mat4 scale =  uniform_scale(0.5);
    if (abs(sin(theta)) == 0){
      scale = mat4(
  0.65,0,0,0,
  0,0,0,0,
  0,0,0.65,0,
  0,0,0,1);
    
    }
  //   if (abs(sin(theta)) <= 0.15){
  //     scale = mat4(
  // 0.65-abs(sin(theta)),0,0,0,
  // 0,abs(sin(theta)),0,0,
  // 0,0,0.65-abs(sin(theta)),0,
  // 0,0,0,1);
  //   }
    mat4 shift;
  	shift = translate(vec3(0, 5 *(abs(sin(2*theta))*abs(cos(2*theta))) + 0.6, 0));

    //change shape
    if ((abs(sin(2*theta))*abs(cos(2*theta))) <= 0.03){
      scale = mat4(
      elastic_factor,0,0,0,
      0,elastic_hori*(abs(sin(2*theta))*abs(cos(2*theta))),0,0,
      0,0,elastic_factor,0,
      0,0,0,1);
    }
    // change shape
  //   if (5/time *(abs(sin(2*theta))*abs(cos(2*theta))) <= 0.08){
  //     scale = uniform_scale(0.5);
  //     shift = mat4(
  // 0,0,0,0,
  // 0,0,0,0,
  // 0,0,0,0,
  // 0,0,0,1);
  //   }

  	mat4 model =  rotate_x * shift * scale;
  	return model;
  }
   else if (is_luna){
      float theta = M_PI * time / 2;
      float yy = r * (1 - sin(theta_SMH));
      float xx = sqrt(r*r - (r-yy)*(r-yy));


    
    
    mat4 scale =  uniform_scale(0.5);
    // change shape
    mat4 shift;
    shift = translate(vec3(0, -5 *(abs(sin(2*theta))*abs(cos(2*theta))) - 0.6, 0));
    //shift = translate(vec3(0, -5 *(abs(sin(2*theta))*abs(cos(2*theta))), 0));

    if ((abs(sin(2*theta))*abs(cos(2*theta))) <= 0.03){
      scale = mat4(
      elastic_factor,0,0,0,
      0,elastic_hori*(abs(sin(2*theta))*abs(cos(2*theta))),0,0,
      0,0,elastic_factor,0,
      0,0,0,1);
    }

    mat4 model =  rotate_x * shift * scale;
    return model;
   }
   else if (is_mirana){
      float theta = M_PI * time / 2;
      float yy = r * (1 - sin(theta_SMH));
      float xx = sqrt(r*r - (r-yy)*(r-yy));


    
    
    mat4 scale =  uniform_scale(0.5);
    // change shape
    mat4 shift;
    shift = translate(vec3(6 *(abs(sin(2*theta))*abs(cos(2*theta)))+0.5, 0, 0));
    //shift = translate(vec3(0, -5 *(abs(sin(2*theta))*abs(cos(2*theta))), 0));

    if ((abs(sin(2*theta))*abs(cos(2*theta))) <= 0.03){
      scale = mat4(
      elastic_hori*(abs(sin(2*theta))*abs(cos(2*theta))),0,0,0,
      0,elastic_factor,0,0,
      0,0,elastic_factor,0,
      0,0,0,1);
    }
    mat4 model =  rotate_z * shift * scale;
    return model;
   }

      else if (is_lina){
      float theta = M_PI * time / 2;
      float yy = r * (1 - sin(theta_SMH));
      float xx = sqrt(r*r - (r-yy)*(r-yy));


    
    
    mat4 scale =  uniform_scale(0.5);
    // change shape
    mat4 shift;
    shift = translate(vec3(-6 *(abs(sin(2*theta))*abs(cos(2*theta)))-0.5, 0, 0));
    //shift = translate(vec3(0, -5 *(abs(sin(2*theta))*abs(cos(2*theta))), 0));

    // if ((abs(sin(2*theta))*abs(cos(2*theta))) <= 0.03){
    //   scale = mat4(
    //   10*(abs(sin(2*theta))*abs(cos(2*theta))),0,0,0,
    //   0,0.85,0,0,
    //   0,0,0.85,0,
    //   0,0,0,1);
    // }
    if ((abs(sin(2*theta))*abs(cos(2*theta))) <= 0.03){
      scale = mat4(
      elastic_hori*(abs(sin(2*theta))*abs(cos(2*theta))),0,0,0,
      0,elastic_factor,0,0,
      0,0,elastic_factor,0,
      0,0,0,1);
    }
    mat4 model =  rotate_z * shift * scale;
    return model;
   }
   else if (is_luna){
      float theta = M_PI * time / 2;
      float yy = r * (1 - sin(theta_SMH));
      float xx = sqrt(r*r - (r-yy)*(r-yy));


    
    
    mat4 scale =  uniform_scale(0.5);
    // change shape
    mat4 shift;
    shift = translate(vec3(0, -5 *(abs(sin(2*theta))*abs(cos(2*theta))) - 0.5, 0));
    //shift = translate(vec3(0, -5 *(abs(sin(2*theta))*abs(cos(2*theta))), 0));

    if ((abs(sin(2*theta))*abs(cos(2*theta))) <= 0.03){
      scale = mat4(
      elastic_factor,0,0,0,
      0,elastic_hori*(abs(sin(2*theta))*abs(cos(2*theta))),0,0,
      0,0,elastic_factor,0,
      0,0,0,1);
    }

    mat4 model =  rotate_x * shift * scale;
    return model;
   }
   else if (is_mirana){
      float theta = M_PI * time / 2;
      float yy = r * (1 - sin(theta_SMH));
      float xx = sqrt(r*r - (r-yy)*(r-yy));


    
    
    mat4 scale =  uniform_scale(0.5);
    // change shape
    mat4 shift;
    shift = translate(vec3(5 *(abs(sin(2*theta))*abs(cos(2*theta)))+0.5, 0, 0));
    //shift = translate(vec3(0, -5 *(abs(sin(2*theta))*abs(cos(2*theta))), 0));

    if ((abs(sin(2*theta))*abs(cos(2*theta))) <= 0.03){
      scale = mat4(
      elastic_hori*(abs(sin(2*theta))*abs(cos(2*theta))),0,0,0,
      0,elastic_factor,0,0,
      0,0,elastic_factor,0,
      0,0,0,1);
    }
    mat4 model =  rotate_z * shift * scale;
    return model;
   }
   else if (is_lanaya){
      float theta = M_PI * time / 2;
      float yy = r * (1 - sin(theta_SMH));
      float xx = sqrt(r*r - (r-yy)*(r-yy));


    
    
    mat4 scale =  uniform_scale(0.5);
    // change shape
    mat4 shift;
    shift = translate(vec3(0,0, -7 *(abs(sin(2*theta))*abs(cos(2*theta))) - 0.5));
    //shift = translate(vec3(0, -5 *(abs(sin(2*theta))*abs(cos(2*theta))), 0));

    if ((abs(sin(2*theta))*abs(cos(2*theta))) <= 0.03){
      scale = mat4(
      elastic_factor,0,0,0,
      0,elastic_hori*(abs(sin(2*theta))*abs(cos(2*theta))),0,0,
      0,0,elastic_factor,0,
      0,0,0,1);
    }

    mat4 model =  rotate_about_y(8*theta) * shift * scale;
    return model;
   }
   else if (is_motrai){
      float theta = M_PI * time / 2;
      float yy = r * (1 - sin(theta_SMH));
      float xx = sqrt(r*r - (r-yy)*(r-yy));


    
    
    mat4 scale =  uniform_scale(0.5);
    // change shape
    mat4 shift;
    shift = translate(vec3(0, 0, 7 *(abs(sin(2*theta))*abs(cos(2*theta)))+0.5));
    //shift = translate(vec3(0, -5 *(abs(sin(2*theta))*abs(cos(2*theta))), 0));

    if ((abs(sin(2*theta))*abs(cos(2*theta))) <= 0.03){
      scale = mat4(
      elastic_hori*(abs(sin(2*theta))*abs(cos(2*theta))),0,0,0,
      0,elastic_factor,0,0,
      0,0,elastic_factor,0,
      0,0,0,1);
    }
    mat4 model =  rotate_about_y(8*theta) * shift * scale;
    return model;
   }
   else{
    return mat4(
  0,0,0,0,
  0,0,0,0,
  0,0,0,0,
  0,0,0,1);
    
    }
  }
  
  /////////////////////////////////////////////////////////////////////////////
