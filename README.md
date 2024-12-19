# Autorace
This is the repository for the final project of the robotics course in MSCV Vibot

It contains the complete code, project report, presentation along with the instructions on how to get everything to run

<p float="left">
  <img src="https://www.vibot.org/uploads/2/3/5/8/2358523/696297.png" width="400" />
  <img src="https://user-images.githubusercontent.com/62595618/145738760-61a1fe0c-c297-4c03-8b36-6aabd3469caa.png" width="400" /> 
</p>

<!-- ![image](https://user-images.githubusercontent.com/62595618/145738760-61a1fe0c-c297-4c03-8b36-6aabd3469caa.png) -->

## Technical documentation
[Technical documentation](https://github.com/Q-Chevillard/Autorace/blob/511b83aabb3bfb0c0444316ae1cb6c88e4e65f3f/Technical%20Documentation.pdf)

## Related medias
[Presentation video](https://drive.google.com/file/d/1mtCk5bxuI0p6N6HrjZ6uclQ2sKCshmr7/view?usp=sharing)

[Slides presentation](https://docs.google.com/presentation/d/11ms6gqSAXOzC3bQPsOumJ9zOv5E-BEF2/edit?usp=sharing&ouid=111443997314803573241&rtpof=true&sd=true)

[Other stuff](https://drive.google.com/drive/folders/1_yZ78yg9CAFjahyFoOScyZC6Cuo5MB2w?usp=sharing)

## User manual
### Installation
The following instructions describes how to install packages and to calibrate camera.

Note: The code has been verified to be working on ROS Kinetic, compatibility with other ros distributions is not guaranteed.

1. Install Autorace package on both Remote PC and SBC.
   
   ```cd ~/catkin_ws/src/```
   
   ```git clone -b kinetic-devel https://github.com/Q-Chevillard/Autorace.git```
   
   ```cd ~/catkin_ws && catkin_make```


2. Install additional dependent packages on Remote PC.

   ```sudo apt-get install ros-kinetic-image-transport ros-kinetic-cv-bridge ros-kinetic-vision-opencv python-opencv libopencv-dev ros-kinetic-image-proc```

### Running the code
1. Launch roscore in **remote PC**

   ```roscore```

2. Bringup the robot in **ssh**

   ```roslaunch turtlebot3_bringup turtlebot3_robot.launch```
   
3. Start the camera in **ssh**

   ```roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch```
   
If you just want to do lane following goto step 4, otherwise if you want to perform the traffic light mission as well as lane following skip to step 5.

4. launch the lane follower launcher script in **remote PC**

   ```./<directory>/lane_follower_launcher.sh```

5. launch the traffic light launcher script in **remote PC**

   ```./<directory>/traffic_light_launcher.sh```
