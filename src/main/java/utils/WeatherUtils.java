package utils;

public class WeatherUtils {
	
	public double getHeatIndex(double t,double rh)
	{
		double heatIndex = (-42.379)+(2.0491523*t)+(10.14333127*rh)-(0.22475541*t*rh)-(0.00683783*t*t)-(0.05481717*rh*rh)+(0.00122874*t*t*rh)+(0.00085282*t*rh*rh)+(0.00000199*t*t*rh*rh);      
	    return heatIndex;
	}
			
	public double getStandardDeviation(double[] averageTemperature)
	{
		{
	        double sum = 0.0, standardDeviation = 0.0;
	        int length = averageTemperature.length;
	        for(double num : averageTemperature) 
	        {
	            sum += num;
	        }
	        double mean = sum/length;
	        for(double num: averageTemperature) 
	        {
	            standardDeviation += Math.pow(num - mean, 2);
	        }
	        return Math.sqrt(standardDeviation/length);
	    }
		
	}
}
