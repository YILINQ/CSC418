#include "Sphere.h"
#include "Ray.h"

bool Sphere::intersect(
  const Ray & ray, const double min_t, double & t, Eigen::Vector3d & n) const
{
  ////////////////////////////////////////////////////////////////////////////
    Eigen::Vector3d d = ray.direction;
    Eigen::Vector3d e = ray.origin;
    Eigen::Vector3d c = center;
    double A = d.dot(d);
    double B = 2 * d.dot(e - c);
    double C = (e - c).dot(e - c) - radius * radius;
    double delta = B * B - 4 * A * C;
  if (delta < 0){
      return false;
  }

  if (delta == 0){
    t = ((-1) * B + sqrt(delta)) / (2 * A);
  }
  if (delta > 0){
    double t1 = ((-1) * B + sqrt(delta)) / (2 * A);
    double t2 = ((-1) * B - sqrt(delta)) / (2 * A);
    if (t1 < t2){
        t = t1;
        if(t1 < min_t) {
            if(t2 < min_t){
                return false;
            }
            else{
                t = t2;
            }
        }
    }
    else{
        // t2 < t1
        t = t2;
        if (t2 < min_t){
            if (t1 < min_t){
                return false;
            }
            else{
                t = t1;
            }
        }
    }
  }
  if (t > min_t){
      Eigen::Vector3d hit_point = ray.direction * t + ray.origin;
      n = (hit_point - center) / radius;
      return true;
  }
  else{
      return false;
  }
  ////////////////////////////////////////////////////////////////////////////
}

