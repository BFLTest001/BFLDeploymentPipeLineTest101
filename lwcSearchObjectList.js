import { LightningElement, track, wire } from 'lwc';
    import getAccounts from '@salesforce/apex/lwcApexController.searchAccountNameMethod';
    import { NavigationMixin } from 'lightning/navigation';


    const DELAY = 100;
    
    export default class LwcSearchObjectList extends NavigationMixin (LightningElement) {
        accountName = '';
      @track accountList= [];
      @wire (getAccounts,{
            accStrName:'$accountName'
         })
      retrieveAccounts({error, data}){
          if(data){
              this.accountList=data;          
          }
          else if(error){
    
          }
          
      }

      viewRecord(event) {
        // Navigate to Account record page
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                "recordId": event.target.value,
                "objectApiName": "Account",
                "actionName": "view"
            },
        });
    }
    
      searchAccountAction(event){
          //this.accountName = event.target.value;
          const searchString = event.target.value;
          window.clearTimeout(this.delayTimeout);
          this.delayTimeout = setTimeout(() => {
              this.accountName = searchString; 
          }, DELAY);
      }
    }