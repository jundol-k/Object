import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class CommandQuerySeparation {
    public static void main(String[] args) {
        Event metting = new Event("metting", LocalDateTime.of(2021, 11, 15, 9, 00), Duration.ofMinutes(30));

        RecurringSchedule schedule = new RecurringSchedule("metting", DayOfWeek.WEDNESDAY, LocalTime.of(10, 30), Duration.ofMinutes(30));
    }
}
