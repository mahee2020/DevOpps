trigger WalletTrigger on Wallet__c (before insert) {
    if(trigger.isBefore &&  trigger.isInsert){

        WalletTriggerHandler.updateBalanceValue(trigger.new);

    }

}