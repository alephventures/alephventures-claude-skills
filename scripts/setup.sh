#!/usr/bin/env bash
set -euo pipefail

# Salesforce Claude Plugin — Setup & Prerequisites Check
# Run this script to verify your environment is ready.

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PASS="${GREEN}✓${NC}"
FAIL="${RED}✗${NC}"
WARN="${YELLOW}!${NC}"

errors=0

echo ""
echo "Salesforce Claude Plugin — Setup Check"
echo "======================================="
echo ""

# 1. Check Node.js
echo -n "Node.js (v18+)... "
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version | sed 's/v//')
    NODE_MAJOR=$(echo "$NODE_VERSION" | cut -d. -f1)
    if [ "$NODE_MAJOR" -ge 18 ]; then
        echo -e "${PASS} v${NODE_VERSION}"
    else
        echo -e "${FAIL} v${NODE_VERSION} (need v18+)"
        echo "  Install: https://nodejs.org/ or use nvm: nvm install 18"
        errors=$((errors + 1))
    fi
else
    echo -e "${FAIL} not found"
    echo "  Install: https://nodejs.org/ or use nvm: nvm install 18"
    errors=$((errors + 1))
fi

# 2. Check npm
echo -n "npm... "
if command -v npm &> /dev/null; then
    echo -e "${PASS} $(npm --version)"
else
    echo -e "${FAIL} not found"
    echo "  npm comes with Node.js — install Node.js first"
    errors=$((errors + 1))
fi

# 3. Check Salesforce CLI
echo -n "Salesforce CLI (sf)... "
if command -v sf &> /dev/null; then
    SF_VERSION=$(sf --version 2>/dev/null | head -1)
    echo -e "${PASS} ${SF_VERSION}"
else
    echo -e "${FAIL} not found"
    echo "  Install: npm install -g @salesforce/cli"
    errors=$((errors + 1))
fi

# 4. Check for authenticated orgs
echo -n "Authenticated Salesforce org... "
if command -v sf &> /dev/null; then
    ORG_JSON=$(timeout 15 sf org list --json 2>/dev/null || true)
    if [ -z "$ORG_JSON" ]; then
        echo -e "${WARN} check timed out (sf CLI may be updating)"
        echo "  Verify manually: sf org list"
    else
        ORG_COUNT=$(echo "$ORG_JSON" | grep -c '"username"' || true)
        if [ "$ORG_COUNT" -gt 0 ]; then
            DEFAULT_ORG=$(echo "$ORG_JSON" | grep -o '"alias":"[^"]*"' | head -1 | cut -d'"' -f4)
            echo -e "${PASS} ${ORG_COUNT} org(s) authenticated (${DEFAULT_ORG:-no alias})"
        else
            echo -e "${WARN} no orgs authenticated"
            echo "  Authenticate: sf org login web --alias my-org --set-default"
        fi
    fi
else
    echo -e "${FAIL} skipped (sf CLI not installed)"
fi

# 5. Check npx (for MCP server)
echo -n "npx... "
if command -v npx &> /dev/null; then
    echo -e "${PASS} $(npx --version)"
else
    echo -e "${FAIL} not found"
    echo "  npx comes with npm — install Node.js first"
    errors=$((errors + 1))
fi

echo ""
echo "---------------------------------------"

if [ "$errors" -gt 0 ]; then
    echo -e "${FAIL} ${errors} issue(s) found. Fix them and re-run this script."
    echo ""
    echo "Quick fix:"
    echo "  1. Install Node.js 18+: https://nodejs.org/"
    echo "  2. Install SF CLI:      npm install -g @salesforce/cli"
    echo "  3. Authenticate:        sf org login web --alias my-org --set-default"
    exit 1
else
    echo -e "${PASS} All prerequisites met!"
    echo ""
    echo "Next steps:"
    echo "  1. If you haven't authenticated yet:"
    echo "     sf org login web --alias my-org --set-default"
    echo "  2. Start Claude Code with the plugin:"
    echo "     claude --plugin-dir ./alephventures-claude-skills"
    echo "  3. Try it out:"
    echo "     /salesforce describe the Account object"
    exit 0
fi
