public with sharing class WalletTriggerHandler {
   public static void updateBalanceValue(List<Wallet__c>listNewWallet){
       for (Wallet__c balance:listNewWallet){
        if (balance.INR_Balance__c<10000 )
        {
            balance.Value__c='Min';
        }
        else if (balance.INR_Balance__c>10000 )
        {
            balance.Value__c='Max';
        }
        else if (balance.INR_Balance__c==10000 )
        {
            balance.Value__c='default';
        }
     }
    }
}