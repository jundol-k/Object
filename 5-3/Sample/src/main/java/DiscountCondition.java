import java.time.DayOfWeek;
import java.time.LocalTime;

public interface DiscountCondition {
    boolean isSatisfiedBy(Screening screening);
}
