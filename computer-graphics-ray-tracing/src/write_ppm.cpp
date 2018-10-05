#include "write_ppm.h"
#include <fstream>
#include <cassert>
#include <iostream>

bool write_ppm(
  const std::string & filename,
  const std::vector<unsigned char> & data,
  const int width,
  const int height,
  const int num_channels)
{
  ////////////////////////////////////////////////////////////////////////////
  // Replace with your code here:
    if (num_channels == 1){
  std::ofstream outFile(filename, std::ios::binary);
  if (!outFile){
      return false;
  }
  outFile << "P5" << "\n";
  outFile << width;
  outFile << " ";
  outFile << height << "\n";
  outFile << 255 << "\n";
  for (int i = 0; i <= width * height * num_channels - 1; i++){
      outFile << data[i];
    }
  }
  else{
      std::ofstream outFile(filename, std::ios::binary);
      if (!outFile){
          return false;
      }
      outFile << "P6" << "\n";
      outFile << width;
      outFile << " ";
      outFile << height << "\n";
      outFile << 255 << "\n";
  for (int i = 0; i <= width * height * num_channels - 1; i++){
      outFile << data[i];
    }
  }

  return true;
  ////////////////////////////////////////////////////////////////////////////
}
