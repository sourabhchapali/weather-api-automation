# weather-api-automation

### Assignment:
1. Calculate and sort in ascending order w.r.t Heat Index of Delhi and Chennai.
(Hint: given an air temperature (T) and a relative humidity (rh)
Heat Index Formula:
Display the result in console or save in a file.
2. Calculate the Standard Deviation in temperature of Bengaluru for upcoming week
starting from tomorrow(w.r.t the date to receiving assignment). And display the result in
console/ file.
3. Navigate to https://www.apixu.com/api-explorer.aspx, and get suggestions for keyword
“Delhi”. From the results, select any(randomly) and get climate details for that
suggestion(listed from previous list). 

### Command to run all tests parallelly
mvn clean test -Dcucumber.options="--plugin html:target/cucumber-html" -Dtest=ParallelTestRunner.java -Dkarate.env=prod

### Scenarios Location
1. Assignment 1 = https://github.com/sourabhchapali/weather-api-automation/blob/master/src/test/java/scenarios/assignment1.feature
2. Assignment 2 = https://github.com/sourabhchapali/weather-api-automation/blob/master/src/test/java/scenarios/assignment2.feature
3. Assignment 3 = https://github.com/sourabhchapali/weather-api-automation/blob/master/src/test/java/scenarios/assignment3.feature

### CSV File location for Assignment 1
https://github.com/sourabhchapali/weather-api-automation/blob/master/src/test/java/heatIndex.csv
