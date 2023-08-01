import { LightningElement ,track} from 'lwc';
import getPrice from '@salesforce/apex/NesscoinServiceTest.getPrice';
export default class GetPriceTest extends LightningElement {
@track RandomPrice;
@track errro;


    handleChange(event){
        getPrice().then(result=>{
            this.RandomPrice=result;
                return this.RandomPrice;
        })
        .catch(error=>{
            this.error=error;
        });
        }
    
}