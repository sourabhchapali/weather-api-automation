package utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class CSVUtils {

    public  void CSVDataUploader(String city,double heatIndex) throws IOException {
       
        File file = new File("src/test/java/heatIndex.csv");
        FileWriter fr = new FileWriter(file, true);
        BufferedWriter br = new BufferedWriter(fr);
        String data = "\n"+city+","+heatIndex;
        br.write(data);
        br.close();
        fr.close();
    }

    public  void CSVHeader() throws IOException {

        File file = new File("src/test/java/heatIndex.csv");
        FileWriter fr = new FileWriter(file, true);
        BufferedWriter br = new BufferedWriter(fr);
        String data = "CITY, HEAT INDEX";
        br.write(data);
        br.close();
        fr.close(); 
    }

    public void CSVCleaner() throws IOException {
    	
        File file = new File("src/test/java/heatIndex.csv");
        if (file.exists()) {
            file.delete();
        }
        FileWriter out = new FileWriter(file);
        out.close();
    }
    

}