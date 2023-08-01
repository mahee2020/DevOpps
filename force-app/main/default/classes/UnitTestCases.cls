@isTest
public class UnitTestCases {
    @isTest
    public static void walletTest()
    {
        List<Wallet__c> listName = [select Name ,INR_Balance__c,Nesscoin_Balance__c from Wallet__c];
        System.assertEquals( 3,listName.size(),'Not Matching');
    }
   
}