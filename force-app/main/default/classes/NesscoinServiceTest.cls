public with sharing class NesscoinServiceTest {
    @AuraEnabled
    public static Integer getPrice()
    {
        integer endNum=1000;
        Integer startNum=750;
        //Now find random number staring from 0 to diffInRange
        Integer returnValue;
        //Logic- first we will generate random boolean value which will decide if we want to
        //add the random number from startNum or will subtract random number from endNum
        Integer randomNumber = Integer.valueof((math.random() * 10));
        boolean addSubFlag= math.mod(randomNumber,2) == 0 ? true : false;
        
        integer diffInRange = endNum-startNum;
        //Now find random number staring from 0 to diffInRange
        Integer randomNum = Math.mod(Math.round(Math.random()*diffInRange+1),diffInRange);
        
        //If addSubFlag is true, we will add random number generated between 0 and diffInRange from start number
        //else we will subtract random number from end number
                if(addSubFlag){
            if(diffInRange > 1)
                returnValue =startNum + randomNum;
            else
                returnValue =startNum;
        }else{
            if(diffInRange > 1)
                returnValue = endNum - randomNum;
            else
                returnValue =endNum;
        }
        return returnValue;
    }

    }