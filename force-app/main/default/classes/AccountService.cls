public with sharing class AccountService {
    public void getAllAccount() {
        List<Account>acclist= new List<Account>();
    acclist=[select id ,name from account with SECURITY_ENFORCED];
    for(Account aa: acclist){
    System.debug('aa');
}

    }
}