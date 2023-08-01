public with sharing class HotelService {

    private  List<Hotel__c> getHotelDetails(String hotelName) {

        List<Hotel__c> hotelDetails = new List<Hotel__c>();
        hotelDetails = [select name,room_Type__c,price__c from Hotel__c where Name = :hotelName with SECURITY_ENFORCED];
        return hotelDetails;
    
    }
    private  List<City__c> getAllHotelsForCity(String cityName) {
        List<City__c> hotelRecordsForCity = new List<City__c>();
        hotelRecordsForCity = [select Name,(select Name, Room_Type__C from Hotel__r) from City__c where City__c.Name=:cityName with SECURITY_ENFORCED];
        return hotelRecordsForCity;

    }

    private  void createDeals(Deal__c dealObj) {
        Deal__c newDeal = new Deal__c ( Name=dealObj.name,Description__c=dealObj.Description__c,Discount__c=dealObj.Discount__c );
        insert newDeal;

      }

    private List<Hotel__c> getBestDeals(String hotelName){
    List<Hotel__c>bestDeal= new List<Hotel__c>();
    bestDeal= [select (select  Name, Discount__c,Description__c from Deals__r Order By Discount__c DESC limit 2),Name from Hotel__c where Name=:hotelName with SECURITY_ENFORCED];
    return bestDeal;
}

}