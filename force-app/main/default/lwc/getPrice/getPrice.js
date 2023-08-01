import { LightningElement ,track} from 'lwc';
import getPrice from '@salesforce/apex/NesscoinService.getPrice';
export default class GetPrice extends LightningElement {
    @track RandomPrice;
    @track errro;
    @track timer=5000;

connectedCallback() {  
          
    this._interval = setInterval(() => {  
        this.timer = this.timer + 5000;  
        console.log(this.timer);
        getPrice().then(result=>{
            this.RandomPrice=result;
               
        })
        .catch(error=>{
            this.error=error;
        });
        },this.timer);
    
}
       get coinPrice(){
           console.log('Price',JSON.stringify(this.RandomPrice));
           return this.RandomPrice;
       }     
}