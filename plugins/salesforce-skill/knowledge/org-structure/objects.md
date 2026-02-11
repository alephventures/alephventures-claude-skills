# Custom Objects and Relationships

Document your org's custom objects, their purposes, and how they relate to each other.

## Standard Object Notes

<!-- Add notes about how your org uses standard objects (Account, Contact, Opportunity, etc.) -->
<!-- Example:
### Account Hierarchy

We use a parent-child Account hierarchy to represent corporate structures.
`ParentId` on Account links subsidiaries to their parent company.

> Added by jsmith on 2025-01-15
-->

## Custom Objects

<!-- Add custom objects your org uses -->
<!-- Example:
### Project__c

Tracks client projects. Master-detail to Account, lookup to Opportunity.

- **API Name**: `Project__c`
- **Key relationships**:
  - `Account__c` (Master-Detail → Account)
  - `Opportunity__c` (Lookup → Opportunity)
  - Child: `Milestone__c` (via `Project__c` lookup)
- **Record count**: ~5,000
- **Used by**: Project Management team

> Added by jdoe on 2025-01-20
-->

## Relationship Map

<!-- Document key object relationships, especially non-obvious ones -->
<!-- Example:
### Project → Account → Opportunity chain

Project__c → Account (master-detail)
Opportunity → Account (standard lookup)
To find all projects related to an opportunity's account:
```sql
SELECT Id, Name FROM Project__c
WHERE Account__c IN (SELECT AccountId FROM Opportunity WHERE Id = '006...')
```

> Added by jsmith on 2025-02-01
-->
