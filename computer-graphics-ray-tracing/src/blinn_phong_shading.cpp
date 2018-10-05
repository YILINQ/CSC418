#include "blinn_phong_shading.h"
// Hint:
#include "first_hit.h"
#include <iostream>
#include <algorithm>

Eigen::Vector3d blinn_phong_shading(
  const Ray & ray,
  const int & hit_id, 
  const double & t,
  const Eigen::Vector3d & n,
  const std::vector< std::shared_ptr<Object> > & objects,
  const std::vector<std::shared_ptr<Light> > & lights)
{
  ////////////////////////////////////////////////////////////////////////////
  // Replace with your code here:
  Eigen::Vector3d p = ray.origin + t * ray.direction;
  Eigen::Vector3d rgb;
  for(int i = 0; i < lights.size();i++){
      Eigen::Vector3d l;
      double t_prime;
      int id;

      lights[i]->direction(p, l, t_prime);
      Eigen::Vector3d h = (-ray.direction.normalized() + l.normalized()).normalized();

      double max_1;
      if (0 < n.dot(l)){
          max_1 = n.dot(l);
      }
      else{
          max_1 = 0;
      }

      double max_2;
        if (0 < n.dot(h)){
          max_2 = n.dot(h);
      }
      else{
          max_2 = 0;
      }
      // shoot a ray from p to light source, check if this ray hit any object
      Ray shadow_r;
      shadow_r.direction = l;
      shadow_r.origin = p;
      double shadow_t;
      Eigen::Vector3d shadow_n;

      if(!first_hit(shadow_r, std::numeric_limits<double>::epsilon()*1000, objects, id, shadow_t, shadow_n) || shadow_t > t_prime){
              rgb += (objects[hit_id]->material->kd.array() * lights[i]->I.array()).matrix() * max_1 +  // kd
                     (objects[hit_id]->material->ks.array() * lights[i]->I.array()).matrix() *  // ks
                     pow(max_2, objects[hit_id]->material->phong_exponent);


      }
  }

  return rgb;
  ////////////////////////////////////////////////////////////////////////////
}
