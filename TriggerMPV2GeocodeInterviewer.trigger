/*******Trigger Name : TriggerMPV2GeocodeInterviewer  Author : Shilpa kamble Date : 25/8/2015 Details : Dynamically generated tigger on object to insert,update & delete the map point *********************************/ Trigger TriggerMPV2GeocodeInterviewer on Interviewer__c(after Update,before delete,after insert,after undelete,after delete){List < Extentia_SIM__MP_CustomMapping__c > MappingList = [SELECT Name FROM Extentia_SIM__MP_CustomMapping__c WHERE Extentia_SIM__Entity__c ='Interviewer__c' LIMIT 1];String CSName = 'Extentia_SIM__MapPlotterTriggerSettings__c';String fldName = 'Extentia_SIM__Bypass_Trigger__c';String triggerName = 'Bypass Interviewer Trigger';boolean skip = false;List<Sobject> lstObj = new List<Sobject>();if(!Test.isRunningTest()){String query = 'SELECT Id, Name FROM '+CSName+' WHERE Name =: triggerName AND '+fldName+' = true ';lstObj = Database.query(query);}String strTriggerEvent;List < ApexPage > pageList = [SELECT Name FROM ApexPage WHERE Name IN ('Map_Plotter_Setting', 'Extentia_SIM__Map_Plotter_Setting')];if(!pageList.isempty() && !MappingList.isEmpty()){if(lstObj.size() > 0){skip = true;}if(!skip){if(trigger.isUpdate){strTriggerEvent = Extentia_SIM.Helper_MPConstants.EVENT_UPDATE;Extentia_SIM.Helper_Geocode.TriggerHandler(Trigger.new,strTriggerEvent);}if(trigger.isInsert){strTriggerEvent =Extentia_SIM.Helper_MPConstants.EVENT_INSERT;Extentia_SIM.Helper_Geocode.TriggerHandler(Trigger.new,strTriggerEvent);}if(trigger.isDelete){strTriggerEvent = Extentia_SIM.Helper_MPConstants.EVENT_DELETE;Extentia_SIM.Helper_Geocode.TriggerHandler(Trigger.old,strTriggerEvent);}if(trigger.isUndelete){strTriggerEvent = Extentia_SIM.Helper_MPConstants.EVENT_UNDELETE;Extentia_SIM.Helper_Geocode.TriggerHandler(Trigger.new,strTriggerEvent);}}}}