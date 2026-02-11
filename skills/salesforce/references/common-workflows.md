# Common Salesforce Workflows

## Exploring an Object

1. **Describe the object** to see all fields, types, and relationships
2. **Check the knowledge base** (`knowledge/org-structure/`) for org-specific notes
3. **Run a sample query** with `LIMIT 5` to see actual data shapes
4. **Identify key fields**: required fields, custom fields, formula fields

## Finding Records

1. Ask what the user is looking for (entity type, criteria)
2. Identify the correct object (check knowledge base for custom object names)
3. Build a SOQL query with appropriate filters
4. Start with `COUNT()` if unsure about result set size
5. Present results with key fields (Name, Id, relevant custom fields)

## Understanding Relationships

1. Describe the parent object to find child relationships
2. Describe the child object to find lookup/master-detail fields
3. Use subqueries to show related records
4. Check `knowledge/org-structure/objects.md` for documented relationships

## Data Quality Checks

### Find Duplicates
```sql
-- Duplicate contacts by email
SELECT Email, COUNT(Id)
FROM Contact
WHERE Email != null
GROUP BY Email
HAVING COUNT(Id) > 1
```

### Find Missing Data
```sql
-- Accounts without contacts
SELECT Id, Name FROM Account
WHERE Id NOT IN (SELECT AccountId FROM Contact)
```

### Find Stale Records
```sql
-- Opportunities not modified in 90 days that are still open
SELECT Name, StageName, LastModifiedDate
FROM Opportunity
WHERE IsClosed = false
AND LastModifiedDate < LAST_N_DAYS:90
ORDER BY LastModifiedDate ASC
```

## Reporting Patterns

### Pipeline Summary
```sql
SELECT StageName, COUNT(Id) num, SUM(Amount) total
FROM Opportunity
WHERE IsClosed = false
GROUP BY StageName
ORDER BY SUM(Amount) DESC
```

### Activity Summary
```sql
SELECT Owner.Name, COUNT(Id)
FROM Task
WHERE CreatedDate = THIS_MONTH
AND Status = 'Completed'
GROUP BY Owner.Name
ORDER BY COUNT(Id) DESC
```

### Record Creation Trend
```sql
SELECT CALENDAR_MONTH(CreatedDate) month, COUNT(Id)
FROM Lead
WHERE CreatedDate = THIS_YEAR
GROUP BY CALENDAR_MONTH(CreatedDate)
ORDER BY CALENDAR_MONTH(CreatedDate)
```

## Working with Custom Objects

1. Custom objects end with `__c` (e.g., `Project__c`)
2. Custom fields end with `__c` (e.g., `Budget__c`)
3. Custom relationships use `__r` for traversal (e.g., `Project__r.Name`)
4. Always check `knowledge/org-structure/objects.md` for the correct API names — labels in the UI often differ from API names

## Safely Modifying Data

1. **Always query first** — show the user what will be affected
2. **Confirm before writing** — list the records and fields to be changed
3. **Use specific IDs** — update by Id, not by broad WHERE clauses
4. **Check for triggers/flows** — mention that DML may fire automation
5. **Report results** — show success/failure counts after operations
