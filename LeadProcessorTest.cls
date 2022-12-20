@isTest
private  class LeadProcessorTest {

    @TestSetup
    static void makeData(){
        List<Lead> l =  new List<Lead>();
        for (Integer i = 0; i<200; i++) {
            l.add(new Lead(FirstName = 'lead'+i ,LastName = 'asd',status = '1', Company='x'));
        }
        insert l;
    }
 
    @isTest
    static void test(){
        Test.startTest();
        LeadProcessor lp =  new LeadProcessor();
        Database.executeBatch(lp);

        Test.stopTest();

        System.assertEquals(200, [Select COUNT() from Lead where LeadSource = 'Dreamforce'],'');
    }
}
