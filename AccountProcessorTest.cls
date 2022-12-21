@IsTest
public class AccountProcessorTest {
    
    @IsTest
    private static void testCountContacts() {
        
        Integer accountsNumber = 1;
        Integer contactsNumber = 3;
        List<String> accountsListIds =   TestDataFactory.createAccountsWithContact(accountsNumber,contactsNumber);
        
        Test.startTest();
        AccountProcessor.countContacts(accountsListIds);
        Test.stopTest();
       
        System.assertEquals(accountsNumber, [SELECT count() FROM Account WHERE Number_Of_Contacts__c = :contactsNumber]);
    }
}