# Org-Specific SOQL Patterns

SOQL queries and patterns that work well with your org's data model.

## Frequently Used Queries

<!-- Example:
### Active Enterprise Accounts with Open Opportunities

```sql
SELECT Id, Name, Account_Tier__c,
  (SELECT Name, Amount, StageName FROM Opportunities WHERE IsClosed = false)
FROM Account
WHERE Account_Tier__c = 'Enterprise'
AND Id IN (SELECT AccountId FROM Opportunity WHERE IsClosed = false)
ORDER BY Name
```

Useful for quarterly business reviews. Note: filter on Account_Tier__c first since it's indexed.

> Added by jsmith on 2025-01-15
-->

## Query Optimizations

<!-- Document org-specific query tips -->
<!-- Example:
### Use `RecordType.DeveloperName` Instead of `RecordTypeId`

```sql
-- Good: readable and portable across orgs
WHERE RecordType.DeveloperName = 'Customer'

-- Avoid: ID changes between sandbox and prod
WHERE RecordTypeId = '012000000000001'
```

> Added by jdoe on 2025-01-20
-->

## Common Filters

<!-- Document frequently used WHERE clauses -->
<!-- Example:
### Active Users Only

```sql
WHERE OwnerId IN (SELECT Id FROM User WHERE IsActive = true)
```

Always filter by active users in reports to exclude departed employees.

> Added by jsmith on 2025-02-01
-->
