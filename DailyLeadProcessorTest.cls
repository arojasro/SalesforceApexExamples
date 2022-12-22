@isTest
public with sharing class DailyLeadProcessorTest {
    //Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static final String CRON_EXP = '0 0 12 1/1 * ? *';

    @isTest
    private static void testScheduledJob() {
       

        //insert data  test
        List<Lead> acc =  new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            acc.add(new Lead(FirstName = 'lead'+i ,LastName = 'asd',status = '1', Company='x'));
        }
        insert acc;

        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('DaylyLead', CRON_EXP, new DailyLeadProcessor());
        // Stopping the test will run the job synchronously
        Test.stopTest();
        
        System.assertEquals(200, [Select count() FROM Lead WHERE LeadSource = 'Dreamforce' ],'Error: updated quantity do not match');
    }


}
