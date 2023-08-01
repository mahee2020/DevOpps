@isTest
public with sharing class UnitTests {

    @isTest
    public static void walletTest()
    {
        List<Wallet__c> listName = [select Name ,INR_Balance__c,Nesscoin_Balance__c from Wallet__c];
        System.assertEquals( listName.size(),3,'Not Matching');
    }
   
}