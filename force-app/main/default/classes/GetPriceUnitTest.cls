@isTest
public class GetPriceUnitTest {
    //positive test cases 
    @isTest
    private static void testVerifyPrice(){
        Integer data= NesscoinService.getPrice();
        System.assert(data>750 &&data<1000,'data is not in range for 750 and 1000');       
    }
    @isTest
    private static void testVerifyPriceBoundaryValue(){
        Integer data= NesscoinService.getPrice();
        System.assert(data>=750 &&data<=1000,'data is not in range Bwt 750 and 1000');       
    }
    @isTest
    private static void testVerifyPriceNotNull(){
        Integer price= NesscoinService.getPrice();
        System.assert(price!=0, 'Price is a null value');
    }
    //Negative test cases 
     @isTest
    private static void testVerifyPriceOutOfRange(){
        Integer price= NesscoinServiceTest.getPrice();
        System.assertNotEquals(740,price,'price is not is the range');
    }
    

}