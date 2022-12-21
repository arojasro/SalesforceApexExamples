@isTest
public class TestDataFactory {
    
    public static List<String> createAccountsWithContact(Integer numAccts, Integer numContacts) {
       List<String> listIds = new  List<String>();
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Contact> contacts = new List<Contact>();
        for (Account a :accts) {
            //fill output list
            
            listIds.add(a.Id);
            System.debug('add id to list'+a.Id);
            
            // For each account just inserted, add contact
            for (Integer k=0;k<numContacts;k++) {
                
                contacts.add(new Contact(FirstName=a.Name + ' Contact ' + k,
                                         LastName='lastname'+k,
                                     AccountId=a.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert contacts;
      
        System.debug('contacts '+contacts);
        System.debug('ids'+listIds);
        return listIds;
    }
}