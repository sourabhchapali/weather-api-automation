@StandardDEviation

Feature: Standard Deviation of weather

Background:
* def CommonUtils = Java.type('utils.CommonUtils')
* def cu = new CommonUtils()
* def WeatherUtils = Java.type('utils.WeatherUtils')
* def wu = new WeatherUtils()
* def apiVersion = cu.getEndPointURL('apiVersion')
* def forecastWeather = cu.getEndPointURL('forecastWeather')
* def key = cu.getApiKey('key')


Scenario Outline: Calculate the Standard Deviation in temperature of Bengaluru for upcoming week
         starting from tomorrow
         
# Calling the forecaste weather api 
Given url baseUrl 
And path apiVersion
And path forecastWeather
And param key = key
And param q = <city>
And param days = <days>
When method get
Then status 200

# JavaScript function to convert a Array into double array , as this logic is scenario specific so used here
* def jsonToDoubleArrayConverter =
"""
function()
{
var averageTemperatureArray = []
for( var i=0;i<response.forecast.forecastday.length;i++)
	{
	averageTemperatureArray[i] = response.forecast.forecastday[i].day.avgtemp_c
	}
return averageTemperatureArray	
}
"""

* def temperatureArray = jsonToDoubleArrayConverter()

 # Using JAVA Interop to calculate and get the Standard Deviation using formula 
* def standardDeviation = wu.getStandardDeviation(temperatureArray)

 # Printing standard deviation 
* print "STANDARD DEVIATION IS --> "+standardDeviation+"°C FOR CITY "+<city>

#City is scenario specific data and hence used here 
Examples:
| city        | days | 
| 'Bengaluru' | 7    |
