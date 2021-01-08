#!/usr/bin/env python
# license removed for brevity
import time
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import NavSatFix
import serial
ls = list()
ser = serial.Serial('/dev/ttyUSB1', 57600)  # open serial port

class publishGPS(object):

	def __init__(self):
		rospy.loginfo("Initialising GPS publishing")
		self.gps_sub=rospy.Subscriber('/GPS_talker_1',String, self.callback, queue_size=1)
		self.lastMsg=None
		self.gps_pub=rospy.Publisher('/gps_new', NavSatFix, queue_size=1)
		rospy.sleep(0.5)
		rospy.loginfo("initialised")

	def callback(self, data):
		self.lastMsg=data

	def do_work(self):
		self.splitStrings= str(self.lastMsg).split(",")
		gpsmsg=NavSatFix()
		gpsmsg.header.stamp = rospy.Time.now()
		gpsmsg.header.frame_id = "GPS_link"
		data = ser.readline()
		ls = data.split(",")
		Info = "lat:"+ str(float(ls[0])/100) + "  lon:" + str(float(ls[1])/100) + "  alt:" + ls[2]
		rospy.loginfo(Info)
		gpsmsg.latitude = float(ls[0])/100  #Shift decimal by 2 towards left
		gpsmsg.longitude = float(ls[1])/100
		gpsmsg.altitude = float(ls[2])
		
		self.gps_pub.publish(gpsmsg)

	def run(self):
		r=rospy.Rate(1)
		while not rospy.is_shutdown():
			self.do_work()
			r.sleep()

if __name__=='__main__':
	rospy.init_node('pubgps')
	obj=publishGPS()
	obj.run()


if __name__ == '__main__':
	main()



