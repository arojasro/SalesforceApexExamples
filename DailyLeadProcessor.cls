public without sharing class DailyLeadProcessor implements Schedulable {

    public void execute(SchedulableContext ctx) {
        // WITH SECURITY_ENFORCED to check permisions
        List<Lead> leads = [Select Id FROM Lead WHERE LeadSource = NULL  WITH SECURITY_ENFORCED limit 200];

        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }

        update leads;

    }
}