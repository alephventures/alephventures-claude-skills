# Naming Conventions

Document your org's naming conventions for objects, fields, and other metadata.

## Object Naming

<!-- Example:
### Custom Object Pattern
- Format: `[Feature]_[Entity]__c`
- Examples: `PM_Project__c`, `PM_Milestone__c`, `FIN_Invoice__c`
- Prefix by team/domain to avoid collisions

> Added by jsmith on 2025-01-15
-->

## Field Naming

<!-- Example:
### Custom Field Pattern
- Format: `[Descriptive_Name]__c`
- Booleans: prefix with `Is_` or `Has_` (e.g., `Is_Active__c`, `Has_Subscription__c`)
- Dates: suffix with `_Date` (e.g., `Renewal_Date__c`)
- Lookups: suffix with `_Ref__c` to distinguish from ID fields

> Added by jdoe on 2025-01-20
-->

## Apex & Automation Naming

<!-- Example:
### Trigger Naming
- Format: `[Object]Trigger` (e.g., `AccountTrigger`)
- One trigger per object, handler class pattern

### Flow Naming
- Format: `[Object] - [Action] - [Type]`
- Example: "Account - Update Territory - Record Triggered"

> Added by jsmith on 2025-02-01
-->

## Label vs. API Name Reference

<!-- Document cases where UI labels differ significantly from API names -->
<!-- Example:
### Common Label/API Mismatches
| UI Label | API Name | Object |
|---|---|---|
| "Customer Score" | `Account_Health_Score__c` | Account |
| "Project Status" | `PM_Status__c` | PM_Project__c |
| "Deal Size" | `Opportunity_Tier__c` | Opportunity |

> Added by jdoe on 2025-02-05
-->
