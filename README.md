# Turtlebot3_SLAM
Based on Livox, Rplidar and camera.  Software: Navigation

# **Application of SLAM in garbage collection in makeshift hospitals**

------
**1 Introduction**
Up to April 25th, 2022, there were 400 shelter hospitals in China alone, and can receive about 560000 patients. In GuoBo Shelter Hospital, there were only 34 members in the cleaning team, who were responsible for about 10000 square meters of cleaning area and 3 tons of rubbish per day.
Cleaners in shelter hospitals not only suffer from infection risk, but also are overwhelmed by heavy workloads.

Collecting and transporting the garbage is a repetitive work, which is very suitable for robots. Therefore, our group believes that developing a self-navigating robot for garbage transportation in shelter hospitals can generate great value.

To achieve this, we first use the r3live framework to fuse the information collected by livox Lidar and RGB camera, which results in a 3D shelter hospital map.

Next, we use rplidar Lidar and AMCL algorithm to predict the location of the robot. The ODOM information measured by the robot chassis is also included to reduce the prediction error.
Finally, the A-star algorithm and livox lidar is used to achieve path planning and automatically avoid obstacles.

We hope our product can help fight the Covid-19 epidemic, and the infectious diseases yet to come.
![Model of Product](https://s2.loli.net/2022/06/14/FOJ96qBTtl7zSoQ.png)

##**1.1 Hardware**
Hikvision camera is chosen to be involved in sensor fusion with livox lidar. Livox lidar is both used on mapping and path planning; rplidar is used for positioning. The underpan in our project is Scout mini.
![hardware.jpg](https://s2.loli.net/2022/06/14/WCgfV4UdlMTBHsQ.jpg)

------

##**2 Prerequisites**
The project needs Ubuntu and ROS.
The version of Ubuntu is 20.04. ros Noetic. 
ROS Installation and its additional ROS pacakge:

```sudo apt-get install ros-XXX-cv-bridge ros-xxx-pcl-conversions```

###**2.1 [Livox SDK Installation](https://github.com/Livox-SDK/Livox-SDK)**
For Ubuntu 20.04
```
# install preprequisites —— SDK is based on cmake
sudo apt install cmake

git clone https://github.com/Livox-SDK/Livox-SDK.git
cd Livox-SDK
cd build && cmake ..
make
sudo make install
```

###**2.2 livox-ros-driver**
Follow [livox-ros-driver](https://github.com/Livox-SDK/livox_ros_driver).

###**2.3 [Livox Viewer](https://www.livoxtech.com/cn/downloads)**
The version on the link is Ubuntu16.04, but the Ubuntu20.04 can operate it normally. The Livox Viewer can help you directly look at the point cloud file shape. But before using this viewer, you must ensure your computure and lidar are under the same IP address, the last bit of the ip address cannot be the same as the radar. 

###**2.4 [Hikcamera SDK Installation](https://www.hikrobotics.com/cn/machinevision/service/download?module=0)**
Download the related verison and install in your computer.
```sudo dpkg -i name.deb```

###**2.5 [HiKcamera ROS driver](https://www.hikrobotics.com/cn/machinevision/service/download?module=0)**
Here is a [tutorial](https://blog.csdn.net/qqh2411988311/article/details/118764773) about the ROS driver. Follow it to install hikcamera ros driver.

###**2.6 lidar_camera_calib**
Follow [lidar_camera_calib](https://github.com/hku-mars/livox_camera_calib).

###**2.7 [scout_base ROS driver](https://github.com/agilexrobotics/scout_ros)**
Installation and compilation:
```
cd ~/catkin_ws/src
git clone --recursive https://github.com/agilexrobotics/ugv_sdk.git
cd ugv_sdk && git checkout v2.x
cd ..
git clone https://github.com/agilexrobotics/scout_ros.git
cd .. && catkin_make
```

##**3 Preparing related data**
### **3.1 Prepare for the Intrinsics**
```
sudo apt-get install camera_calibration
rosrun camera_calibration cameracalibrator.py --size 8x6 --square 0.025 image:=/hikrobot_camera/rgb camera:=/hikrobot --no-service-check
```
The 8x6 is the grid number and 0.025 is the grid size.
Get the instrinsic matrix and distor coeffs for your camera.

### **3.2 Prepare for the extrinsics**
####**3.2.1 Record the pcd files for calibration**
Use the ivox-ros-driver to record a rosbag and transform the rosbag to pcd file.
```
cd ws_livox
source devel/setup.bash
roslaunch livox_ros_driver livox_lidar_msg.launch
rosbag record -a
rosrun pcl_ros bag_to_pcd path_bag_name.bag \topic storage-path
```

#### **3.2.2 Record a image for calibration**
Use the HiKcamera to take a picture is every ok.
```
cd /opt/MVS/bin
./MVS
```
![mvs.png](https://s2.loli.net/2022/06/14/jycThp3oGigEreB.png)

#### **3.2.3 Prepare for the extrinsics matrix**
Provide the instrinsic matrix and distor coeffs for your camera. Change the data path in calib.yaml to your local data path.
```roslaunch livox_camera_calib calib.launch```

Get the exstrinsic matrix and distor coeffs.

## **4 R3live Mapping**
Follow the link to clone and catkin_make the [r3live](https://github.com/hku-mars/r3live).
Here are three problems we need to modify.

1. Replace the intrinsics and extrinsics in ```r3live/config/r3live_config.yaml```.
2. Replace the livox_ros_driver with the one provided by r3live.
3. Replace the topic name of lidar and camera in ```r3live/r3live_bag.launch```.

```
roscore

cd ws_livox
source devel/setup.bash
roslaunch livox_ros_driver livox_lidar_msg.launch 

cd

cd ws_hikrobot_camera/
source devel/setup.bash
roslaunch hikrobot_camera hikrobot_camera.launch

cd
rosbag record -a

cd r3live
source devel/setup.bash
roslaunch r3live r3live_bag.launch

```

Save the output map(.pcd) in the r3live_output_result file.

### **4.1 [Flatten the 3D map](https://blog.csdn.net/studentu/article/details/119699663)**
Here is a method to transform 3D SLAM point cloud map(.pcd) to 2D raster map(.pgm and the corresponding .yaml).

Install pcd2pgm：
```
#creating worksapce
mkdir -p ~/pcd2pgm_ws/src
cd ~/pcd2pgm_ws/src
catkin_init_workspace
 
#install
git clone https://github.com/hujiax380/pcd2pgm.git
```

The executable file(.cpp) is as following, remember to change the pcd file path and name:
```
#include <ros/ros.h>
 
#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/GetMap.h>
 
#include <sensor_msgs/PointCloud2.h>
#include <pcl/io/pcd_io.h>
#include <pcl_conversions/pcl_conversions.h>
 
#include <pcl/point_types.h>
#include <pcl/filters/passthrough.h>  
#include <pcl/filters/voxel_grid.h>  
#include <pcl/filters/statistical_outlier_removal.h>  
#include <pcl/filters/conditional_removal.h>   
#include <pcl/filters/radius_outlier_removal.h>   
 
std::string file_directory;
std::string file_name;
std::string pcd_file;
 
std::string map_topic_name;
 
const std::string pcd_format = ".pcd";
 
nav_msgs::OccupancyGrid map_topic_msg;
 
double thre_z_min = 0.3;
double thre_z_max = 2.0;
int flag_pass_through = 0;
 
double grid_x = 0.1;
double grid_y = 0.1;
double grid_z = 0.1;
 
double map_resolution = 0.05;
 
double thre_radius = 0.1;
 
pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_after_PassThrough(new pcl::PointCloud<pcl::PointXYZ>);
pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_after_Radius(new pcl::PointCloud<pcl::PointXYZ>);
pcl::PointCloud<pcl::PointXYZ>::Ptr pcd_cloud(new pcl::PointCloud<pcl::PointXYZ>);
 
void PassThroughFilter(const double& thre_low, const double& thre_high, const bool& flag_in);
 
void RadiusOutlierFilter(const pcl::PointCloud<pcl::PointXYZ>::Ptr& pcd_cloud, const double &radius, const int &thre_count);
 
void SetMapTopicMsg(const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, nav_msgs::OccupancyGrid& msg);
 
int main(int argc, char** argv)
{
   ros::init(argc, argv, "pcl_filters");
   ros::NodeHandle nh;
   ros::NodeHandle private_nh("~");
 
   ros::Rate loop_rate(1.0);
 
   private_nh.param("file_directory", file_directory, std::string("/home/ubuntu/"));//change the pcd path
   ROS_INFO("*** file_directory = %s ***\n", file_directory.c_str());
 
 
   private_nh.param("file_name", file_name, std::string("good2"));//"good2" needs to be changed into the pcd file name of your own, don't add the filename extension ".pcd".
   ROS_INFO("*** file_name = %s ***\n", file_name.c_str());
 
   pcd_file = file_directory + file_name + pcd_format;
   ROS_INFO("*** pcd_file = %s ***\n", pcd_file.c_str());
 
   private_nh.param("thre_z_min", thre_z_min, 0.5);
   private_nh.param("thre_z_max", thre_z_max, 2.0);
   private_nh.param("flag_pass_through", flag_pass_through, 0);
   private_nh.param("grid_x", grid_x, 0.1);
   private_nh.param("grid_y", grid_y, 0.1);
   private_nh.param("grid_z", grid_z, 0.1);
   private_nh.param("thre_radius", thre_radius, 0.5);
   private_nh.param("map_resolution", map_resolution, 0.05);
   private_nh.param("map_topic_name", map_topic_name, std::string("map"));
 
   ros::Publisher map_topic_pub = nh.advertise<nav_msgs::OccupancyGrid>(map_topic_name, 1);
 
   if (pcl::io::loadPCDFile<pcl::PointXYZ> (pcd_file, *pcd_cloud) == -1)
   {
     PCL_ERROR ("Couldn't read file: %s \n", pcd_file.c_str());
     return (-1);
   }
 
   std::cout << "初始点云数据点数：" << pcd_cloud->points.size() << std::endl;
 
   PassThroughFilter(thre_z_min, thre_z_max, bool(flag_pass_through));
 
//   RadiusOutlierFilter(cloud_after_PassThrough, 0.1, 10);
//   SetMapTopicMsg(cloud_after_Radius, map_topic_msg);
 
   SetMapTopicMsg(cloud_after_PassThrough, map_topic_msg);
 
   while(ros::ok())
   {
     map_topic_pub.publish(map_topic_msg);
 
     loop_rate.sleep();
 
     ros::spinOnce();
   }
 
   return 0;
}
 
void PassThroughFilter(const double &thre_low, const double &thre_high, const bool &flag_in)
{
  
    pcl::PassThrough<pcl::PointXYZ> passthrough;
    passthrough.setInputCloud(pcd_cloud);
    passthrough.setFilterFieldName("z");
    passthrough.setFilterLimits(thre_low, thre_high);
    passthrough.setFilterLimitsNegative(flag_in);
    passthrough.filter(*cloud_after_PassThrough); cloud_after_PassThrough
    std::cout << "直通滤波后点云数据点数：" << cloud_after_PassThrough->points.size() << std::endl;
}
 
void RadiusOutlierFilter(const pcl::PointCloud<pcl::PointXYZ>::Ptr& pcd_cloud0, const double &radius, const int &thre_count)
{
    pcl::RadiusOutlierRemoval<pcl::PointXYZ> radiusoutlier;  
 
    radiusoutlier.setInputCloud(pcd_cloud0);    
    radiusoutlier.setRadiusSearch(radius);     
    radiusoutlier.setMinNeighborsInRadius(thre_count); 
 
    radiusoutlier.filter(*cloud_after_Radius);
    std::cout << "半径滤波后点云数据点数：" << cloud_after_Radius->points.size() << std::endl;
}
 
void SetMapTopicMsg(const pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, nav_msgs::OccupancyGrid& msg)
{
  msg.header.seq = 0;
  msg.header.stamp = ros::Time::now();
  msg.header.frame_id = "map";
 
  msg.info.map_load_time = ros::Time::now();
  msg.info.resolution = map_resolution;
 
  double x_min, x_max, y_min, y_max;
  double z_max_grey_rate = 0.05;
  double z_min_grey_rate = 0.95;
  double k_line = (z_max_grey_rate - z_min_grey_rate) / (thre_z_max - thre_z_min);
  double b_line = (thre_z_max * z_min_grey_rate - thre_z_min * z_max_grey_rate) / (thre_z_max - thre_z_min);
 
  if(cloud->points.empty())
  {
    ROS_WARN("pcd is empty!\n");
 
    return;
  }
 
  for(int i = 0; i < cloud->points.size() - 1; i++)
  {
    if(i == 0)
    {
      x_min = x_max = cloud->points[i].x;
      y_min = y_max = cloud->points[i].y;
    }
 
    double x = cloud->points[i].x;
    double y = cloud->points[i].y;
 
    if(x < x_min) x_min = x;
    if(x > x_max) x_max = x;
 
    if(y < y_min) y_min = y;
    if(y > y_max) y_max = y;
  }
 
  msg.info.origin.position.x = x_min;
  msg.info.origin.position.y = y_min;
  msg.info.origin.position.z = 0.0;
  msg.info.origin.orientation.x = 0.0;
  msg.info.origin.orientation.y = 0.0;
  msg.info.origin.orientation.z = 0.0;
  msg.info.origin.orientation.w = 1.0;
 
  msg.info.width = int((x_max - x_min) / map_resolution);
  msg.info.height = int((y_max - y_min) / map_resolution);
 
  msg.data.resize(msg.info.width * msg.info.height);
  msg.data.assign(msg.info.width * msg.info.height, 0);
 
  ROS_INFO("data size = %d\n", msg.data.size());
 
  for(int iter = 0; iter < cloud->points.size(); iter++)
  {
    int i = int((cloud->points[iter].x - x_min) / map_resolution);
    if(i < 0 || i >= msg.info.width) continue;
 
    int j = int((cloud->points[iter].y - y_min) / map_resolution);
    if(j < 0 || j >= msg.info.height - 1) continue;
 
    msg.data[i + j * msg.info.width] = 100;
//    msg.data[i + j * msg.info.width] = int(255 * (cloud->points[iter].z * k_line + b_line)) % 255;
  }
}
```
Compile:
```
cd ~/pcd2pgm_ws
catkin_make
```

Convert the map:
```
roscore
 
#new terminal
rosrun pcd2pgm pcd2topic
```
Launch map_server:
```
#new terminal, save map
rosrun map_server map_saver
```

##**5. Navigation**
Download the [turtlebot3_navigation](https://github.com/ROBOTIS-GIT/turtlebot3).
```
cd navigation_ws/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
catkin_make

pip install pyttsx3
sudo apt install espeak
```
### **5.1 Places need to change according to the sample hardware**
Owing to we have exactly different hardware, we need to build the transformation tree. So here are some places need to change if you are using scout chassis and rplidar A1 too. If you don’t use the same hardware, hope the following modify may help you.

1\. Replace chassis ros dirver launch file with ```turtlebot3_bringup/launch/turtlebot3_core.launch``` and remember to pubilsh its own tf data. Following is the launch file:
```
<launch>
    <arg name="multi_robot_name" default=""/>
    <arg name="port_name" value="can0" />
    <arg name="simulated_robot" value="false" />
    <arg name="model_xacro" default="$(find scout_description)/urdf/scout_v2.xacro" />
    <arg name="odom_topic_name" default="odom" />
    <arg name="is_scout_mini" default="true" />
    <arg name="pub_tf" default="true" />
```
2\. Replace lidar launch file with ```turtlebot3_bringup/launch/turtlebot3_lidar.launch```, and add the following sentence in your new launch file:
```
<arg name="set_frame_id" default="base_scan"/>
```
3\. Delete the following sentence in ```turtlebot3_navigation/launch/turtlebot3_navigation.launch```.
```
<!-- Turtlebot3 -->
  <include file="$(find turtlebot3_bringup)/launch/turtlebot3_remote.launch">
    <arg name="model" value="$(arg model)" />
  </include>
```
4\. Change all the base_footprint into base_link: Since the topicnof scout chassis is base_link
5. Change the observation_sources in costmap to scan: Since the topic name of rplidar A1 is scan.
6. Instead of simple naviagtion, there are also send goal file to pub a goal.

### **5.2 Steps to run the sample hardware**
```
# set up chassis
sudo modprobe gs_usb
sudo ip link set can0 up type can bitrate 500000
candump can0

# launch rplidar
ls -l /dev |grep ttyUSB0
sudo chmod 777 /dev/ttyUSB0

# launch robot
roslaunch turtlebot3_bringup turtlebot3_robot.launch
# launch navigation
roslaunch turtlebot3_navigation turtlebot3_navigation.launch

# launch livox lidar
cd
cd ws_livox
roslaunch livox_ros_driver livox_lidar_msg.launch
																								
# publish lidar msg to move_base
rosrun turtlebot3_slam pub.py

# publish the goal place
rosrun turtlebot3_example send_goal_dyx.py
```
Here is another steps which intergrated the launch steps above.
```
sudo modprobe gs_usb

sudo ip link set can0 up type can bitrate 500000

candump can0

ls -l /dev |grep ttyUSB0

sudo chmod 777 /dev/ttyUSB0

roslaunch turtlebot3_bringup turtlebot3_all.launch

rosrun turtlebot3_example send_goal_dyx.py
```

##6 Acknowledgements
Thanks to [R3LIVE](https://github.com/hku-mars/r3live), [lidar_camera_calib](https://github.com/hku-mars/livox_camera_calib),  Prof.Xiaoping Hong, Chongjian Yuan and Wen Yang.
