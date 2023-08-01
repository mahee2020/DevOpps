public with sharing class PackageSchedule implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bC){

        return Database.getQueryLocator('select Name from Package__c where End_Date_c= :system.Today()+1');
     }
     public void execute(Database.BatchableContext bC, List<Package__c> scope){
       }
       public void finish(Database.BatchableContext bC){

    }
}