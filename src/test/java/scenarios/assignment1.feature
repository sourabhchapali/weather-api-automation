@FindHeatIndex

Feature: Find Heat Index

Background:
* def CommonUtils = Java.type('utils.CommonUtils')
* def cu = new CommonUtils()
* def WeatherUtils = Java.type('utils.WeatherUtils')
* def wu = new WeatherUtils()
* def CSVUtils = Java.type('utils.CSVUtils')
* def csu = new CSVUtils()
* def apiVersion = cu.getEndPointURL('apiVersion')
* def currentWeather = cu.getEndPointURL('currentWeather')
* def key = cu.getApiKey('key')
* print currentWeather

Scenario: Initial steps to clean up csv and put headers

* eval csu.CSVCleaner()
* eval csu.CSVHeader()


Scenario Outline: Calculate and sort in ascending order w.r.t Heat Index of Delhi and Chennai.
         (Hint: given an air temperature (T) and a relative humidity (rh)

# Calling the current weather api 
Given url baseUrl 
And path apiVersion
And path currentWeather
And param key = key
And param q = <city>
When method get
Then status 200

 #Storing humidity and temperature for further manipulation
* def relativeHumidity = response.current.humidity
* def airTemperature = response.current.temp_c  

 #Printing humidity and temperature
* print "RELATIVE HUMIDITY FOR "+<city>+" IS "+relativeHumidity+"rh"
* print "AIR TEMPERATURE FOR "+<city>+" IS "+airTemperature+"°C"

 #Using JAVA Interop to calculate and get the Heat Index using standard formula 
* def heatIndex = wu.getHeatIndex(airTemperature,relativeHumidity)
* eval csu.CSVDataUploader(<city>,heatIndex)

#City is scenario specific data and hence used here 
Examples:
| city      | 
| 'delhi'   | 
| 'chennai' | 


