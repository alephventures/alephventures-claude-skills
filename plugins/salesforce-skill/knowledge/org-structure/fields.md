# Key Custom Fields and Picklists

Document important custom fields, formula fields, and picklist values in your org.

## Custom Fields by Object

<!-- Example:
### Account

#### `Account_Tier__c` (Picklist)
Customer tier classification used for support routing and pricing.
- Values: `Enterprise`, `Mid-Market`, `SMB`, `Partner`
- Default: `SMB`
- Used by: Support team for case routing rules

> Added by jsmith on 2025-01-15

#### `Annual_Contract_Value__c` (Currency)
Roll-up summary of all active Opportunity amounts.
- Formula: Sum of Opportunities where StageName = 'Closed Won' and CloseDate is this fiscal year
- Used in reports and dashboards

> Added by jdoe on 2025-01-20
-->

## Formula Fields

<!-- Document formula fields that are important to understand -->
<!-- Example:
### Opportunity: `Days_in_Stage__c`
Formula: `TODAY() - LastStageChangeDate__c`
Shows how long the opportunity has been in its current stage. Used in pipeline review dashboards.

> Added by jsmith on 2025-02-01
-->

## Picklist Value Reference

<!-- Document picklist values that are frequently needed in queries -->
<!-- Example:
### `Opportunity.StageName` Values
Our org uses a custom sales process with these stages:
1. `Prospecting`
2. `Discovery`
3. `Proposal`
4. `Negotiation`
5. `Closed Won`
6. `Closed Lost`
7. `On Hold` (custom addition)

> Added by jdoe on 2025-02-05
-->
