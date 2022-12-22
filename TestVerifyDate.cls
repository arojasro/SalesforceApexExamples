@isTest
public class TestVerifyDate {   
    @isTest
    private  static void checkDatesWithin30Days() {
        Date date1 = Date.newInstance(2022, 2, 17);
        Date date2 = Date.newInstance(2022, 2, 18);
        Date res =  VerifyDate.CheckDates( date1,  date2) ;
        System.assertEquals(date2,res);
    }
    @isTest
    private  static void checkDatesEndOfMonthDate() {
        Date date1 = Date.newInstance(2022, 2, 17);
        Date date2 = Date.newInstance(2022, 3, 20);
        
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
		
        
        Date res =  VerifyDate.CheckDates( date1,  date2) ;
        System.assertEquals(lastDay, res);
    }
}