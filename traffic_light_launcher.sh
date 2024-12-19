#!/bin/bash
gnome-terminal -- bash -c "echo '### CAMERA CALIBRATION ### \n';
			 roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch;
			 bash"
gnome-terminal -- bash -c "echo '### INTRINSIC CALIBRATION ### \n';
			 export AUTO_IN_CALIB=action;
			 export GAZEBO_MODE=false;
			 roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_intrinsic_camera_calibration.launch;
			 bash"
gnome-terminal -- bash -c "echo '### TRAFFIC LIGHT CORE ### \n';
			 export AUTO_EX_CALIB=action;
			 export AUTO_DT_CALIB=action;
			 roslaunch turtlebot3_autorace_traffic_light_core turtlebot3_autorace_core.launch;
			 bash"
gnome-terminal -- bash -c "echo '### RQT ### \n';
			 rqt;
			 bash"
gnome-terminal -- bash -c "echo '### SEND ### \n';
			 rostopic pub -1 /core/decided_mode std_msgs/UInt8 'data: 3';
			 bash"

