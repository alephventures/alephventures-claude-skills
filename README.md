# Aleph Ventures — Claude Code Skills

Shared Claude Code skills for the Aleph Ventures team. Currently includes Salesforce integration with a shared knowledge base that gets smarter over time.

## What You Get

- **`/salesforce`** — Query data, explore objects, inspect metadata, and manage your org using natural language
- **`/sf-teach`** — Add org-specific knowledge (custom objects, field names, gotchas) to a shared knowledge base
- **Shared knowledge base** — Team-maintained markdown docs that give Claude org-specific context
- **Salesforce MCP integration** — 60+ tools for SOQL, metadata, data operations, and more

## Prerequisites

| Requirement | Version | Install |
|---|---|---|
| Node.js | v18+ | [nodejs.org](https://nodejs.org/) |
| Salesforce CLI | latest | `npm install -g @salesforce/cli` |
| Claude Code | v1.0+ | [claude.ai/claude-code](https://claude.ai/claude-code) |

Run the setup check to verify:

```bash
./scripts/setup.sh
```

## Installation

### From Plugin Marketplace

```
/plugin marketplace add alephventures/alephventures-claude-skills
/plugin install alephventures-claude-skills
```

### Manual (Local Development)

```bash
git clone https://github.com/alephventures/alephventures-claude-skills.git
claude --plugin-dir ./alephventures-claude-skills
```

## Authentication

Each team member authenticates with their own Salesforce credentials. No shared service accounts.

### First-Time Setup

1. **Authenticate with your Salesforce org:**

   ```bash
   sf org login web --alias my-org --set-default
   ```

2. A browser window opens — log in with your Salesforce credentials and approve access.

3. Done. SF CLI stores tokens securely in your local keychain. Token refresh is automatic.

### Multiple Orgs

```bash
# Authenticate additional orgs
sf org login web --alias prod
sf org login web --alias staging

# Switch default org
sf config set target-org prod

# Check which orgs are authenticated
sf org list
```

### Sandbox Authentication

```bash
sf org login web --alias my-sandbox --instance-url https://test.salesforce.com --set-default
```

## Usage

### Querying Data

```
/salesforce show me all open opportunities over $100k
/salesforce find contacts at Acme Corporation
/salesforce how many leads were created this month?
```

### Exploring Your Org

```
/salesforce describe the Account object
/salesforce what custom fields are on Contact?
/salesforce show me the relationship between Project__c and Account
```

### Building Queries

```
/salesforce help me write a SOQL query to find duplicate leads by email
/salesforce query for accounts with no open opportunities
```

### Adding Knowledge

```
/sf-teach the Project__c object has a master-detail to Account via Account__c
/sf-teach our naming convention for custom objects is [Team]_[Entity]__c
/sf-teach Lead conversion fails if Custom_Status__c is blank — set it to "Qualified" first
```

## Knowledge Base

The `knowledge/` directory is a shared, git-tracked knowledge base. As your team uses `/sf-teach`, it grows with org-specific context:

```
knowledge/
├── org-structure/        # Custom objects, fields, record types
├── best-practices/       # SOQL patterns, data model, naming
├── integrations/         # External system notes
└── troubleshooting/      # Known issues and workarounds
```

See [knowledge/README.md](knowledge/README.md) for contribution guidelines.

## How It Works

```
┌─────────────┐     ┌──────────────────┐     ┌─────────────────┐
│  Claude Code │────▶│ Salesforce Skill  │────▶│ Knowledge Base   │
│  (you type)  │     │ (SKILL.md)       │     │ (markdown files) │
└─────────────┘     └──────────────────┘     └─────────────────┘
                           │
                           ▼
                    ┌──────────────────┐     ┌─────────────────┐
                    │ Salesforce MCP   │────▶│ Your SF Org      │
                    │ (@salesforce/mcp)│     │ (via SF CLI auth) │
                    └──────────────────┘     └─────────────────┘
```

1. You invoke `/salesforce` with a natural language request
2. The skill consults the knowledge base for org-specific context
3. It uses Salesforce MCP tools to query/describe/modify your org
4. Results are presented with context from the knowledge base
5. If new patterns are discovered, you're prompted to save them with `/sf-teach`

## Updating

### From Marketplace

```
/plugin marketplace update
```

### Manual

```bash
cd alephventures-claude-skills
git pull
```

Knowledge base updates are included automatically when you pull.

## Troubleshooting

### "No default org" Error

```bash
sf config set target-org my-org
```

### "INVALID_SESSION_ID" Error

Your token may have expired. Re-authenticate:

```bash
sf org login web --alias my-org --set-default
```

### MCP Server Not Connecting

1. Verify Node.js is installed: `node --version`
2. Verify the MCP server can be downloaded: `npx @anthropic-ai/salesforce-mcp --help`
3. Check `.mcp.json` is in the plugin root directory

### "Insufficient Access" Errors

Your Salesforce user may not have permission to access certain objects or fields. Check with your Salesforce admin about your profile and permission sets.
