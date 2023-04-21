public with sharing class lwcApexController {
    
   
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccountNameMethod (String accStrName){
        String keyNameString = '%' +  accStrName + '%';
        return [Select Id, Name, Phone, Website, Account_Source__c, Industry, Description From Account Where Name like:keyNameString];
     }    

   }