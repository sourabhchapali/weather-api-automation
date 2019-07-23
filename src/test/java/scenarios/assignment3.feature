@Search

Feature: Search climate details for delhi

Background:
* def CommonUtils = Java.type('utils.CommonUtils')
* def cu = new CommonUtils()
* def WeatherUtils = Java.type('utils.WeatherUtils')
* def wu = new WeatherUtils()
* def apiVersion = cu.getEndPointURL('apiVersion')
* def search = cu.getEndPointURL('search')
* def currentWeather = cu.getEndPointURL('currentWeather')
* def key = cu.getApiKey('key')


Scenario: Select climate for any suggestion randomly

# Calling the search weather api 
Given url baseUrl 
And path apiVersion
And path search
And param key = key
And param q = 'delhi'
When method get
Then status 200

# JavaScript function to generate a random number , as this logic is scenario specific so used here
* def generateRandomNumber = 
"""
function()
{
  return Math.floor(Math.random() * Math.floor(10))
}
"""

* def randomNumber = generateRandomNumber()
* def region = response[randomNumber].url


# Calling the current weather api based on region taken from search api
Given url baseUrl 
And path apiVersion
And path currentWeather
And param key = key
And param q = region
When method get
Then status 200

# Printing climate details for region
* print "TEMPERATURE FOR "+city+" IS "+response.current.temp_c+"°C"
* print "HUMIDITY FOR "+city+" IS "+response.current.humidity+"rh"
* print "CLOUD FOR "+city+" IS "+response.current.cloud







