import { LightningElement, api, track, wire } from 'lwc';
import INR_Balance from '@salesforce/schema/Wallet__c.INR_Balance__c';
import Nesscoin_Balance from '@salesforce/schema/Wallet__c.Nesscoin_Balance__c';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import updateRecordValues from '@salesforce/apex/NesscoinService.updateRecordValues';

const fields = [INR_Balance, Nesscoin_Balance];

export default class BuySellNessCoins extends LightningElement {
    @api recordId;
    //get wallet object record and fields
    @wire(getRecord, { recordId: '$recordId', fields})
    walletData;
    @track inrBalance;
    @track nesscoinBalance;
    @api nesscoinPrice;
    @track numberOfCoins;
    @track buyCoins;
    @track sellCoins

    handleCoinsInput(event){
        this.numberOfCoins = event.target.value;
    }

    handleSellCoins() {
      this.inrBalance=getFieldValue(this.walletData.data, INR_Balance);
      this.nesscoinBalance=getFieldValue(this.walletData.data, Nesscoin_Balance);

        this.sellCoins = parseInt(this.numberOfCoins) * this.nesscoinPrice;
        let inr_Balance = this.inrBalance + this.sellCoins;
        let nesscoinBalance = this.nesscoinBalance - parseInt(this.numberOfCoins);

        //call method from apex class
        updateRecordValues({recordId:this.recordId,inrbalance:inr_Balance,nesscoinBalance:nesscoinBalance})
        .then(() => {
          eval("$A.get('e.force:refreshView').fire();");
        })
        .catch(error => {
          console.error(error);
        })
    }

    handleBuyCoins() {
      this.inrBalance=getFieldValue(this.walletData.data, INR_Balance);
      this.nesscoinBalance=getFieldValue(this.walletData.data, Nesscoin_Balance);

      this.buyCoins = parseInt(this.numberOfCoins) * this.nesscoinPrice;
      //increase the ness coin balance based on coins added
      let nesscoin_Balance = this.nesscoinBalance + parseInt(this.numberOfCoins);

      //decrease the balance value onbuying coins
      let inr_Balance = this.inrBalance - this.buyCoins;

      updateRecordValues({recordId: this.recordId, inrbalance: inr_Balance, nesscoinBalance: nesscoin_Balance})
      .then(() => {
          eval("$A.get('e.force:refreshView').fire();");
      })
      .catch(error=>{
       console.log(error);
      });
    }

}