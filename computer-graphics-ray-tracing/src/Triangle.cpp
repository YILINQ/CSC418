#include "Triangle.h"
#include "Ray.h"
#include <Eigen/Geometry>
#include <iostream>

bool Triangle::intersect(
  const Ray & ray, const double min_t, double & t, Eigen::Vector3d & n) const
{
  ////////////////////////////////////////////////////////////////////////////
    Eigen::Vector3d p1 = std::get<0>(corners);
    Eigen::Vector3d p2 = std::get<1>(corners);
    Eigen::Vector3d p3 = std::get<2>(corners);
    Eigen::Vector3d v1 = (p1 - p2);
    Eigen::Vector3d v2 = (p1 - p3);
    Eigen::Vector3d normal = v1.cross(v2) / (v1.cross(v2).norm());

    double delta = (double)(p1 - ray.origin).dot(normal) / (ray.direction.dot(normal));
    if (delta < min_t){
        return false;
    }
    else{
        t = delta;
        n = normal;
        double area12 = 0;
        double area13 = 0;
        double area23 = 0;
        Eigen::Vector3d p = ray.origin + t * ray.direction;
        double areaS = v1.cross(v2).norm();
        Eigen::Vector3d vp1= p1 - p;
        Eigen::Vector3d vp2= p2 - p;
        Eigen::Vector3d vp3= p3 - p;
        area12 = vp1.cross(vp2).norm();
        area13 = vp1.cross(vp3).norm();
        area23 = vp2.cross(vp3).norm();
        // Use machine epsilon to eliminate error.
        if(fabs(areaS - (area12 + area13 + area23)) <= std::numeric_limits<double> :: epsilon()){
            return true;
        }
        else{
            return false;
        }

    }
  ////////////////////////////////////////////////////////////////////////////
}


