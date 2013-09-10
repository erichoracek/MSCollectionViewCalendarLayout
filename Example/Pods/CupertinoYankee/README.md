# A Cupertino Yankee in Scott Forstall's Court
**An NSDate Category With Locale-Aware Calculations for Beginning & End of Day, Week, Month, and Year**

> **Thompson's Law**: Any code that performs sufficiently complex date calculations using naïve arithmetic means has a non-zero chance of causing a Y2K-style collapse of the global technology infrastructure.

If your code defines `kSecondsInDay`, `kSecondsInWeek`--or worst of all--`kSecondsInMonth` (seriously, what would you set for that?)... you may want to reconsider. Date and time systems are really, really complicated. Between all of the [time zones](http://en.wikipedia.org/wiki/List_of_time_zones_by_country), [calendars](http://en.wikipedia.org/wiki/List_of_calendars) and other locale-specific information you should be prepared for, you really can't get it right yourself.

Thank `$DEITY` for `NSCalendar` is all I'm saying. Anyway, this library uses `NSCalendar` and `NSDateComponents` exclusively for date calculation, so you'll handle everything from [leap years](http://en.wikipedia.org/wiki/Leap_year) to [leap months](http://en.wikipedia.org/wiki/Hebrew_calendar#Leap_months) like a champ.

## Example Usage

``` objective-c
NSLog(@"Current Time: %@", date);
NSLog(@"Beginning of Day:%@", [date beginningOfDay]);
NSLog(@"End of Day:%@", [date endOfDay]);
NSLog(@"Beginning of Week:%@", [date beginningOfWeek]);
NSLog(@"End of Week:%@", [date endOfWeek]);
NSLog(@"Beginning of Month:%@", [date beginningOfMonth]);
NSLog(@"End of Month:%@", [date endOfMonth]);
NSLog(@"Beginning of Year:%@", [date beginningOfYear]);
NSLog(@"End of Year:%@", [date endOfYear]);
```

Result (Note the Time Zone and Daylight Savings Offsets)

```
Current Time:       2012-04-17 06:12:21 +0000
Beginning of Day:   2012-04-16 07:00:00 +0000
End of Day          2012-04-17 06:59:59 +0000
Beginning of Week:  2012-04-16 07:00:00 +0000
End of Week:        2012-04-23 06:59:59 +0000
Beginning of Month: 2012-04-01 07:00:00 +0000
End of Month:       2012-05-01 06:59:59 +0000
Beginning of Year:  2012-01-01 08:00:00 +0000
End of Year:        2013-01-01 07:59:59 +0000
```

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

A Cupertino Yankee in Scott Forstall's Court is available under the MIT license. See the LICENSE file for more info.
