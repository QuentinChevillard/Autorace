#!/bin/bash

gnome-terminal --tab -- bash -c "echo -e '### ROSCORE ### \n';
			 roscore;
			 bash"

sleep 2

gnome-terminal --tab -- bash -c "echo -e '### BRING UP CAMERA ### \n';
				 echo -e 'roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch \n \n';
				 sshpass -p "napelturbot" ssh -o StrictHostKeyChecking=no ubuntu@192.168.0.200;
				 bash"

sleep 30



gnome-terminal --tab -- bash -c "echo -e'### INTRINSIC CALIBRATION ### \n';
			 export AUTO_IN_CALIB=action;
			 export GAZEBO_MODE=false;
			 roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_intrinsic_camera_calibration.launch;
			 bash"

gnome-terminal --tab -- bash -c "echo -e '### EXTRINSIC CALIBRATION ### \n';
			 export AUTO_EX_CALIB=action;
			 roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_extrinsic_camera_calibration.launch;
			 bash"

gnome-terminal --tab -- bash -c "echo -e '### DETECT LANE ### \n';
			 export AUTO_DT_CALIB=action;
			 roslaunch turtlebot3_autorace_traffic_light_detect turtlebot3_autorace_detect_lane.launch;
			 bash"

gnome-terminal --tab -- bash -c "echo -e '### RQT ### \n';
			 rqt;
			 bash"

gnome-terminal --tab -- bash -c "echo -e '### CONTROL LANE ### \n';
			 roslaunch turtlebot3_autorace_traffic_light_control turtlebot3_autorace_control_lane.launch;
			 bash"

