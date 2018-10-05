#include "raycolor.h"
#include "first_hit.h"
#include "blinn_phong_shading.h"
#include "reflect.h"
#include <iostream>

bool raycolor(
  const Ray & ray,
  const double min_t,
  const std::vector< std::shared_ptr<Object> > & objects,
  const std::vector< std::shared_ptr<Light> > & lights,
  const int num_recursive_calls,
  Eigen::Vector3d & rgb)
{
  ////////////////////////////////////////////////////////////////////////////
  // Replace with your code here:
  // reflection ray: mirror reflection
  // shadow ray: trace every light.
  int id = 0;
  double t = 0;
  Eigen::Vector3d p;
  Eigen::Vector3d n;
  if(first_hit(ray, 1.0, objects, id, t, n)){
      // find the object id that the ray first hit
      p = ray.origin + t * ray.direction;

      rgb = objects[id]->material->ka;
      rgb += blinn_phong_shading(ray, id, t, n, objects, lights);

      // construct reflection ray
      Ray r_ray;
      r_ray.direction = reflect(ray.direction, n);
      r_ray.origin = p;
      Eigen::Vector3d r_ray_km = objects[id]->material->km;
      Eigen::Vector3d r_color;
      // construct reflection ray

      if (raycolor(r_ray, 0.0001, objects, lights, num_recursive_calls+1, r_color)){
          rgb = rgb + (r_ray_km.array() * r_color.array()).matrix();
      }

      return true;
  }

  else{
    rgb = Eigen::Vector3d(0,0,0);
    return false;
  }
  ////////////////////////////////////////////////////////////////////////////
}
