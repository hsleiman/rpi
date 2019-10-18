import datetime
import logging

logger = logging.getLogger('vacum pump')
file_log_handler = logging.FileHandler('/home/pi/log/vacum_pump_'+str(datetime.datetime.now())+'.log')

var = 1
while var == 1 :  # This constructs an infinite loop
        
	import RPi.GPIO as GPIO
	import time
	GPIO.setmode(GPIO.BCM)
	GPIO.setwarnings(False)
	GPIO.setup(18,GPIO.OUT)
        print "-----------------------------------------------"
	print "Vacum on at " + str(datetime.datetime.now())
	GPIO.output(18,GPIO.HIGH)
	time.sleep(10)
	print "Vacum off at " +  str(datetime.datetime.now())
	GPIO.output(18,GPIO.LOW)
	time.sleep(300)
	
print "Goodbye!"
