import datetime
import logging

logger = logging.getLogger('vacum pump')
file_log_handler = logging.FileHandler('/home/pi/log/vacum_pump_'+str(datetime.datetime.now())+'.log')
logger.addHandler(file_log_handler)


stderr_log_handler = logging.StreamHandler()
logger.addHandler(stderr_log_handler)

# nice output format
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
file_log_handler.setFormatter(formatter)
stderr_log_handler.setFormatter(formatter)

logger.setLevel('DEBUG')

var = 1
while var == 1 :  # This constructs an infinite loop
        
	import RPi.GPIO as GPIO
	import time
	GPIO.setmode(GPIO.BCM)
	GPIO.setwarnings(False)
	GPIO.setup(18,GPIO.OUT)
	print "-----------------------------------------------"
	logger.info('Vacum Turned On')
	GPIO.output(18,GPIO.HIGH)
	time.sleep(10)
	logger.info('Vacum Turned Off')
	GPIO.output(18,GPIO.LOW)
	time.sleep(300)
	
print "Goodbye!"
