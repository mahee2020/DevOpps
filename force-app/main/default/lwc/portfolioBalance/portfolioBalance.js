import { LightningElement, track, api, wire } from "lwc";
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import INR_Balance from '@salesforce/schema/Wallet__c.INR_Balance__c';
import Nesscoin_Balance from '@salesforce/schema/Wallet__c.Nesscoin_Balance__c';

const fields = [INR_Balance, Nesscoin_Balance];
export default class PortfolioBalance extends LightningElement {

    @api nesscoinPrice;
    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields})
    walletData;
    @track portfolio_balance;
    @track inrBalance;
    @track nesscoinBalance;

    get newportfolioBalance(){
        //get field values from custom object Wallet
        this.inrBalance = getFieldValue(this.walletData.data, INR_Balance);
        console.log('inr_balance',this.inrBalance);

        this.nesscoinBalance = getFieldValue(this.walletData.data, Nesscoin_Balance);
        console.log('nesscoin_balance', this.nesscoinBalance);

        //Calculate the portfolio Balance
        this.portfolio_balance = this.inrBalance + (this.nesscoinBalance * this.nesscoinPrice);
        console.log('Portfolio_Balance', JSON.stringify(this.portfolio_balance));
        return this.portfolio_balance;
    }
}