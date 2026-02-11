# Data Model Conventions

Document how your org's data model is structured and any conventions to follow.

## Object Hierarchy

<!-- Example:
### Core Business Objects

```
Account (top-level)
├── Contact (standard)
├── Opportunity (standard)
│   └── OpportunityLineItem (standard)
├── Project__c (custom)
│   └── Milestone__c (custom)
└── Case (standard)
```

> Added by jsmith on 2025-01-15
-->

## Data Conventions

<!-- Example:
### Account Naming
- Company accounts: Legal entity name (e.g., "Acme Corporation")
- Person accounts: Not used in our org
- Duplicate prevention: Match on Name + BillingState

### Opportunity Naming
- Format: `[Account Name] - [Product] - [Quarter]`
- Example: "Acme Corporation - Enterprise License - Q1 2025"

> Added by jdoe on 2025-01-20
-->

## Data Ownership

<!-- Document data ownership rules -->
<!-- Example:
### Territory-Based Ownership
- Accounts are owned by the territory rep
- Opportunities follow account ownership
- Cases are owned by the support queue, then assigned by round-robin

> Added by jsmith on 2025-02-01
-->
