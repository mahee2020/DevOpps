public with sharing class PackageServiceHandler {

    public static void updatePackagePrice(Map<String,List<Logistics__c>>PackageAndLogisticMap){
   
    List<Package__c>pkg= new List<Package__c>();

    for ( String str:  PackageAndLogisticMap.keySet())
    {
        
      for(Logistics__c lObj:PackageAndLogisticMap.get(str)){

        Package__c packageObj=new Package__c();
        Decimal Lolisticfare =lObj.Fare__c;
        packageObj.id=str;
        Decimal actualPack=Lolisticfare*0.18;
        packageObj.Fare__c =actualPack+Lolisticfare;
        pkg.add(packageObj);
    }
    }
    
    
  if(!pkg.isEmpty()){
    update pkg;

    }
}

}