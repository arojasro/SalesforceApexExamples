@isTest
public  class AddPrimaryContactTest {

    @testSetup
    static void setup() {
        //insert 50 Account records for BillingState NY and 50 Account records for BillingState CA
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            String billingState;
            if (i<50) {
                billingState='NY';
            }
            else{
                billingState='CA';
            }
            accounts.add(new Account(
                name='Test Account'+i, BillingState = billingState
            ));
        }

        insert accounts;
    
    }
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        Contact c = new Contact(FirstName='primary',LastName= 'contact',Email='test@test.com');

         // Create our Queueable instance
        AddPrimaryContact addPrimaryContact = new AddPrimaryContact(c, 'NY');
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(addPrimaryContact);
        Test.stopTest();

        System.assertEquals(50,  [select count()  from Contact where FirstName='primary' and LastName= 'contact']);

    }
}