public with sharing class LogisticTriggerHandler {
 

   public static Map<String,List<Logistics__c>> getLogisticData(List<Logistics__c>loicData){

    Map<String,List<Logistics__c>>listofLigistic= new Map<String,List<Logistics__c>>();
     for ( Logistics__c data: loicData)
     {
          if(listofLigistic.containsKey(data.Package__c)){
            List<Logistics__c>logistic= new List<Logistics__c>();
            logistic.add(data);
            listofLigistic.put(data.Package__c,logistic);

          }
          else {
            listofLigistic.put(data.Package__c,new List<Logistics__c>{data}) ;
          }
          

     }
    return listofLigistic;
       
   }

    
}