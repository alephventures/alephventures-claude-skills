# SOQL Quick Reference

## Basic Query Structure

```sql
SELECT field1, field2, field3
FROM ObjectName
WHERE condition
ORDER BY field ASC/DESC
LIMIT n
```

## Common Patterns

### Select with Related Object Fields (Parent)
```sql
SELECT Name, Account.Name, Account.Industry
FROM Contact
WHERE Account.Industry = 'Technology'
```

### Subquery (Child Records)
```sql
SELECT Name, (SELECT LastName, Email FROM Contacts)
FROM Account
WHERE Industry = 'Technology'
```

### Aggregate Queries
```sql
SELECT COUNT(Id), StageName
FROM Opportunity
GROUP BY StageName
HAVING COUNT(Id) > 5
```

### Date Literals
```sql
-- Relative dates
WHERE CreatedDate = TODAY
WHERE CreatedDate = LAST_N_DAYS:30
WHERE CreatedDate = THIS_QUARTER
WHERE CloseDate = NEXT_N_MONTHS:3
WHERE LastModifiedDate = LAST_WEEK

-- Date functions
WHERE CALENDAR_YEAR(CloseDate) = 2025
WHERE DAY_IN_MONTH(CreatedDate) > 15
```

### LIKE Operator (Wildcards)
```sql
WHERE Name LIKE 'Acme%'          -- starts with
WHERE Email LIKE '%@example.com' -- ends with
WHERE Name LIKE '%Corp%'         -- contains
```

### IN Clause
```sql
WHERE StageName IN ('Closed Won', 'Closed Lost')
WHERE Id IN (SELECT AccountId FROM Opportunity WHERE Amount > 100000)
```

### Null Checks
```sql
WHERE Email != null
WHERE Phone = null
```

### Multi-object (Semi-joins)
```sql
-- Accounts that have at least one Opportunity
SELECT Name FROM Account
WHERE Id IN (SELECT AccountId FROM Opportunity)

-- Contacts without any Cases
SELECT Name FROM Contact
WHERE Id NOT IN (SELECT ContactId FROM Case)
```

## Relationship Query Reference

### Standard Relationships
| Child Object | Parent Field | Relationship Name (child→parent) | Relationship Name (parent→child) |
|---|---|---|---|
| Contact | AccountId | Account | Contacts |
| Opportunity | AccountId | Account | Opportunities |
| Case | AccountId | Account | Cases |
| Case | ContactId | Contact | Cases |
| Task | WhoId | Who | Tasks |
| Task | WhatId | What | Tasks |

### Custom Relationships
- Lookup/Master-Detail field: `Custom_Field__c`
- Parent relationship name: `Custom_Field__r`
- Child relationship name: defined on the field (usually `Custom_Objects__r`)

## Governor Limits to Remember

| Limit | Value |
|---|---|
| Total records retrieved | 50,000 |
| SOQL queries per transaction | 100 |
| Query length | 100,000 characters |
| Subqueries per query | 20 |
| Records returned by subquery | 200 |

## Tips

- Always use `LIMIT` when exploring data to avoid hitting governor limits
- Use `WHERE` clauses to narrow results — full table scans on large objects are slow
- Prefer indexed fields in `WHERE` clauses: `Id`, `Name`, `CreatedDate`, `SystemModstamp`, lookup/master-detail fields, `ExternalId` fields
- Use `COUNT()` before `SELECT *` to gauge result set size
- In subqueries, use the **relationship name** (e.g., `Contacts`), not the object name
