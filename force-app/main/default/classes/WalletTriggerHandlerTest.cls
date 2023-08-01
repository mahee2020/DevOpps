@isTest
public class WalletTriggerHandlerTest {
    
    @testSetup
    static void setup(){
        List<Wallet__c>listWallets= new List<Wallet__c>();
        for(Integer i=0;i<3;i++){
            listWallets.add(new Wallet__c(Name='TestWallet01'+i));  
        }
        listWallets[0].INR_Balance__c=9900;
        listWallets[1].INR_Balance__c=10000;
        listWallets[2].INR_Balance__c=15000;
        insert listWallets;
    }
    @isTest
    static void testVerify(){
        Test.startTest();
       List<Wallet__c>listWallet=[select INR_Balance__c,Nesscoin_Balance__c,Value__c from Wallet__c order by INR_Balance__c];
        Test.stopTest();
        System.AssertEquals(listWallet[0].Value__c,'Min');
        System.AssertEquals(listWallet[1].Value__c,'default');
        System.AssertEquals(listWallet[2].Value__c,'Max');
        
    }
    

}