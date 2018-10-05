#include <Eigen/Core>
#include <iostream>

Eigen::Vector3d reflect(const Eigen::Vector3d & in, const Eigen::Vector3d & n)
{
  ////////////////////////////////////////////////////////////////////////////
  // Replace with your code here:
  Eigen::Vector3d r = in - 2 * (n.dot(in) * n);
  return r.normalized();
  ////////////////////////////////////////////////////////////////////////////
}
