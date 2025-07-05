package runner;

import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class RunnerTest {
    @Karate.Test
    Karate testRunner() {
        return Karate.run("classpath:features")
                .tags("@reqres").outputCucumberJson(true);
        //  .relativeTo(getClass());
    }

   /* @Test
    void testParallel() {
        Results results = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .tags("@reqres")
                //.karateEnv("demo")
                .parallel(3);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }*/

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Taller Karate QS");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
