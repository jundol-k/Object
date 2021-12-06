import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.LocalTime;

import static org.junit.jupiter.api.Assertions.*;

public class EventTest {
    private static Event metting;
    private static RecurringSchedule schedule;

    @BeforeAll
    static void before() {
        metting = new Event("metting", LocalDateTime.of(2021, 11, 18, 10, 30), Duration.ofMinutes(30));
        schedule = new RecurringSchedule("metting", DayOfWeek.WEDNESDAY, LocalTime.of(10, 30), Duration.ofMinutes(30));
    }

    @Test
    void isSatisfied() {
        assertFalse(metting.isSatisfied(schedule));
        assertTrue(metting.isSatisfied(schedule));
    }
}