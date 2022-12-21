public class AccountProcessor {
    
    @future
    public static void countContacts(List<String> accountsids){
        
        List<Account> accounts = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id IN :accountsids];
        
        Map<String,Integer> mapResult = new Map<String,Integer>();
        for (AggregateResult res : [Select AccountId, COUNT(Id) cantidad from Contact where AccountId IN :accountsids Group By AccountId ]) {
            mapResult.put(res.get('AccountId').toString(), (Integer)res.get('cantidad'));
        }
        for(Account a : accounts){
            Integer c = (Integer) mapResult.get(a.Id);
            a.Number_Of_Contacts__c = c;
        }
        update accounts;
    }
    
    
}