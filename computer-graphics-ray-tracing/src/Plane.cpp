#include "Plane.h"
#include "Ray.h"
#include <iostream>
bool Plane::intersect(
  const Ray & ray, const double min_t, double & t, Eigen::Vector3d & n) const
{
  ////////////////////////////////////////////////////////////////////////////
  double delta = (double)(point - ray.origin).dot(normal) / (ray.direction.dot(normal));
  if (delta < min_t){
    return false;
  }
  else{
    t = delta;
    n = normal;
    return true;
  }
  ////////////////////////////////////////////////////////////////////////////
}

