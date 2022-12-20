public class AddPrimaryContact implements Queueable {
    Contact contact;
    String state;

    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context) {

        List<Account> accounts = [Select Id from Account WHERE BillingState = :state LIMIT 200];

        List<Contact> contacts = new List<Contact>();

        for (Account a : accounts) {
            contact.AccountId = a.Id;
            contacts.add(contact.clone(false,false,false,false));
        }

        Insert contacts;
    }
}
 