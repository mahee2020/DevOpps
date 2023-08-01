import { LightningElement, track, api, wire } from "lwc";
import {getRecord} from 'lightning/uiRecordApi';
import getPrice from '@salesforce/apex/NesscoinService.getPrice';
export default class NessCoinPrice extends LightningElement {
    @api nesscoinPrice;
    @api recordId;
    @track timer=5000;
    @track error;
    @wire(getRecord, {recordId: '$recordId'}) 
    walletData;
    
    connectedCallback(){
        this._interval = setInterval(() => {
            this.timer = this.timer + 5000;
        getPrice()
        .then(result =>{
            this.nesscoinPrice=result;
        })
        .catch(error=>{
            this.error = error;
        });
        },this.timer);
    }

    get latestNesscoinPrice(){
        console.log('Price',JSON.stringify(this.nesscoinPrice));
        return this.nesscoinPrice;
    }
}