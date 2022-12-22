@isTest
public with sharing class TestRestrictContactByName {
    @isTest static void checkInvalidName() {
        
        Contact c = new Contact(FirstName='Name',LastName='Valid');
        insert c;

        Test.startTest(); 
        c.LastName='INVALIDNAME';
        Database.SaveResult result = Database.update(c,false);
        Test.stopTest();

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
        
    }
}