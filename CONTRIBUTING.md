# Contributing to the Salesforce Knowledge Base

This plugin includes a shared knowledge base that grows as your team uses it. Here's how to contribute.

## Quick Contribution (Recommended)

Use the `/sf-teach` skill to add knowledge in a guided way:

```
/sf-teach [what you want to document]
```

The skill will determine the correct file, format the entry, and add it. You just need to commit and push.

## Manual Contribution

### 1. Choose the Right File

| What you're documenting | File |
|---|---|
| Custom objects and relationships | `knowledge/org-structure/objects.md` |
| Custom fields and picklists | `knowledge/org-structure/fields.md` |
| Record types and business processes | `knowledge/org-structure/record-types.md` |
| SOQL query patterns | `knowledge/best-practices/soql-patterns.md` |
| Data model conventions | `knowledge/best-practices/data-model.md` |
| Naming conventions | `knowledge/best-practices/naming-conventions.md` |
| External integration notes | `knowledge/integrations/api-notes.md` |
| Known issues and workarounds | `knowledge/troubleshooting/common-issues.md` |

### 2. Follow the Entry Format

```markdown
### Brief, Descriptive Title

Clear description of the knowledge, pattern, or insight.
Include API names like `Custom_Object__c` and code examples where relevant.

> Added by your-name on YYYY-MM-DD
```

### 3. Commit and Push

```bash
git add knowledge/
git commit -m "knowledge: brief description"
git push
```

## Guidelines

- **Use API names**: Always include `Object__c` and `Field__c` names, not just UI labels
- **Include "why"**: Explain when and why this knowledge matters
- **Keep it concise**: One concept per entry, scannable format
- **No sensitive data**: Never commit credentials, PII, or actual record data
- **Update, don't duplicate**: If similar knowledge exists, update the existing entry
- **Date your entries**: Include your name and date for traceability

## Reviewing Knowledge PRs

When reviewing a PR that adds knowledge:

1. **Accuracy**: Is the information correct? Test SOQL queries if possible.
2. **Completeness**: Are API names included? Is the "why" explained?
3. **Placement**: Is it in the right file and section?
4. **Freshness**: Does it conflict with existing entries?
5. **Security**: No credentials, PII, or sensitive record data?

## Keeping Knowledge Current

Knowledge can go stale when the org changes. To help:

- When you notice outdated information, update or remove it
- After major org changes (new objects, field renames, process changes), review the relevant knowledge files
- Prefix outdated entries with `[NEEDS REVIEW]` if you're unsure about the current state
