#include "viewing_ray.h"

void viewing_ray(
  const Camera & camera,
  const int i,
  const int j,
  const int width,
  const int height,
  Ray & ray)
{
  ////////////////////////////////////////////////////////////////////////////

  double u = (j - width / 2.0) / 360;
  double v = (height / 2.0 - i)/ 360;

  ray.origin = camera.e;
  ray.direction = -camera.d * camera.w + camera.u * u + camera.v * v;
  ray.direction = ray.direction / ray.direction.norm();
  ////////////////////////////////////////////////////////////////////////////
}
