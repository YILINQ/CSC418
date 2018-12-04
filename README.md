# CSC418 final project
# Please see "final project" for details.
This project is modified from our assignment 6, the shader pipeline.  

You need to clone this link and "cd" to the "cmake" folder.  
For testing result, please run:  

./shaderpipeline ../data/test-04.json  or  
./shaderpipeline ../data/test-05.json  

The idea is to build some basic functionalities like a simple physical engine.  
Specifically, I modified the main.cpp to add more objects, "moon", "luna", "mirana", "lina", "lanaya" and "motrai".  
And I also modified "model" to change the way every objects behave, like giving them a continuous motion and poses.  
For the motion curve, I use trigonometry function to approximate the free-fall curve.  

# Main steps
I first make a motion-cycle for each object, and then make it to roate around x, y or z axis.  
If any two objects collide together at origin, they will bounce back with the same velocities and oppsite directions.  

# The effort
I read the starter code of main.cpp and add objects to our scene.  
I tried different movement functions and compare them, and finally choose the trigonometry functions.  
I also calculate the collision case in 3d space, and set some contrains if objetcs hit each other.  

# conclusion
This is a fun project and in the future I am going to make it smoother and more like a physical engine in our real world!
