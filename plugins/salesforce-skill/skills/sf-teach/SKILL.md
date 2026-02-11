---
name: sf-teach
description: Add knowledge about the Salesforce org to the shared knowledge base. Use when the user wants to document custom objects, fields, naming conventions, known issues, or SOQL patterns.
---

# Salesforce Teach Skill

You help users add knowledge about their Salesforce org to the shared knowledge base. This knowledge is stored in markdown files under the `knowledge/` directory and shared with the whole team via git.

## Invocation

This skill is invoked with `/sf-teach` followed by what the user wants to document.

**Examples:**
- `/sf-teach the Opportunity object has a custom field Deal_Score__c that rates deals 1-5`
- `/sf-teach our naming convention for custom objects is [Team]_[Entity]__c`
- `/sf-teach there's a known issue where Lead conversion fails if Custom_Status__c is blank`
- `/sf-teach the Project__c object has a lookup to Account and a master-detail to Program__c`

## Workflow

### Step 1: Understand What to Document

Parse the user's input to determine:
- **What** they want to document (the fact, pattern, or insight)
- **Category** — which knowledge file it belongs to

### Step 2: Determine the Correct File

Map the knowledge to one of these files:

| Category | File | When to use |
|---|---|---|
| Custom objects, relationships | `knowledge/org-structure/objects.md` | Object definitions, lookups, master-detail, junction objects |
| Custom fields, picklists | `knowledge/org-structure/fields.md` | Field definitions, formulas, validation rules |
| Record types, processes | `knowledge/org-structure/record-types.md` | Record types, page layouts, business processes |
| SOQL patterns | `knowledge/best-practices/soql-patterns.md` | Queries that work well, query optimizations |
| Data model conventions | `knowledge/best-practices/data-model.md` | How data is structured, conventions |
| Naming conventions | `knowledge/best-practices/naming-conventions.md` | API name patterns, label conventions |
| External integrations | `knowledge/integrations/api-notes.md` | Connected apps, API endpoints, sync notes |
| Known issues, workarounds | `knowledge/troubleshooting/common-issues.md` | Bugs, gotchas, workarounds |

If the knowledge doesn't fit any category, ask the user which is the closest fit or suggest creating a new file.

### Step 3: Read the Existing File

Read the target file to understand its current structure and content. Avoid duplicating information that's already documented.

### Step 4: Append the Entry

Add the new knowledge in this consistent format:

```markdown
### [Brief Title]

[Description of the knowledge, pattern, or insight]

[If applicable, include code examples, SOQL queries, or field API names]

> Added by [username] on [date]
```

Use the `Edit` tool to append the entry at the end of the appropriate section in the file. Maintain the existing heading hierarchy.

### Step 5: Confirm and Remind

After adding the entry:
1. Show the user what was added and where
2. Remind them to commit and push so the team benefits:
   ```
   Don't forget to commit and push so your team gets this knowledge:
   git add knowledge/
   git commit -m "knowledge: [brief description]"
   git push
   ```

## Guidelines

- **Keep entries concise** — document the essential facts, not lengthy explanations
- **Use API names** — always include the actual Salesforce API names (e.g., `Custom_Object__c`) alongside labels
- **Include "why"** — briefly explain why this knowledge matters or when it's useful
- **No sensitive data** — never include actual record data, credentials, or PII in the knowledge base
- **Deduplicate** — if similar knowledge exists, update the existing entry rather than adding a duplicate
- **Preserve formatting** — maintain the existing markdown structure of the file
