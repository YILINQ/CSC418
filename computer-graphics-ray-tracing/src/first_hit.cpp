#include "first_hit.h"

bool first_hit(
  const Ray & ray, 
  const double min_t,
  const std::vector< std::shared_ptr<Object> > & objects,
  int & hit_id, 
  double & t,
  Eigen::Vector3d & n)
{
  ////////////////////////////////////////////////////////////////////////////
  double min = 100000000; // inf+
  bool flag = false;
    Eigen::Vector3d temp;
  for(int i = 0; i < objects.size(); i++) {
      //   t  _parametric_ distance along ray so that ray.origin+t*ray.direction is
      //     the hit location
      if (objects[i]->intersect(ray, min_t, t, temp)){
          if (t < min){
              hit_id = i;
              min = t;
              flag = true;
              n = temp;
          }
      }
  }
  t = min;
  return flag;
  ////////////////////////////////////////////////////////////////////////////
}
