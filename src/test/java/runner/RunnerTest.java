package runner;

import com.intuit.karate.junit5.Karate;

public class RunnerTest {
    @Karate.Test
    Karate testRunner() {
        return Karate.run("classpath:features").tags("@listUserByPage").relativeTo(getClass());
    }
}
