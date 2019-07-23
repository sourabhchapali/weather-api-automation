package scenarios;

import com.intuit.karate.cucumber.CucumberRunner;
import com.intuit.karate.cucumber.KarateStats;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.assertTrue;

public class ParallelTestRunner {

    @Test
    public void testParallel() {
        KarateStats stats = CucumberRunner.parallel(getClass(), 2, "target//surefire-reports//");
        generateReport("target//surefire-reports//");
        assertTrue("there are scenario failures", stats.getFailCount() == 0);
    }

    private static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles;
        jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target//surefire-reports//"), "weather-automation");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}