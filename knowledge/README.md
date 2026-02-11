# Salesforce Knowledge Base

This directory contains shared knowledge about your Salesforce org. It is read by the Salesforce Claude Code skill to provide org-specific context when answering questions and building queries.

## Structure

```
knowledge/
├── org-structure/       # What's in your org
│   ├── objects.md       # Custom objects and relationships
│   ├── fields.md        # Key custom fields and picklists
│   └── record-types.md  # Record types and business processes
├── best-practices/      # How to work with your org
│   ├── soql-patterns.md # SOQL patterns that work well
│   ├── data-model.md    # Data model conventions
│   └── naming-conventions.md
├── integrations/        # External connections
│   └── api-notes.md     # Integration notes
└── troubleshooting/     # Known issues
    └── common-issues.md # Issues and workarounds
```

## How to Contribute

### Using `/sf-teach` (recommended)

The easiest way to add knowledge is using the `/sf-teach` skill:

```
/sf-teach the Project__c object has a master-detail to Account
/sf-teach our SOQL pattern for finding active users includes a check on IsActive and LastLoginDate
```

The skill will determine the right file, format the entry, and add it.

### Manual Editing

You can also edit the markdown files directly. Follow this format for entries:

```markdown
### Brief Title

Description of the knowledge, pattern, or insight.

Include API names like `Custom_Object__c` and code examples where relevant.

> Added by your-name on YYYY-MM-DD
```

### Commit and Share

After adding knowledge, commit and push so the team benefits:

```bash
git add knowledge/
git commit -m "knowledge: brief description of what was added"
git push
```

## Guidelines

- **Use API names** — always include `Object__c` and `Field__c` names, not just UI labels
- **Include context** — explain *why* something matters, not just *what* it is
- **Keep it current** — update or remove entries when org changes are made
- **No sensitive data** — never include credentials, PII, or actual record data
- **One concept per entry** — keep entries focused and scannable
