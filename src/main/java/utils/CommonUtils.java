package utils;

import java.io.InputStream;
import java.util.Properties;

public class CommonUtils {
	
	public String getEndPointURL(String key) {
		Properties prop = new Properties();
		try {
			InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("endPointUrls.properties");
			prop.load(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String value = prop.getProperty(key);
		return value;
	}
	
	public String getApiKey(String key) {
		Properties prop = new Properties();
		try {
			InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("apiKey.properties");
			prop.load(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String value = prop.getProperty(key);
		return value;
	}
	

}
