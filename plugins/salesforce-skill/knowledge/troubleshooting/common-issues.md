# Common Issues and Resolutions

Document known issues, gotchas, and workarounds in your Salesforce org.

## Data Issues

<!-- Example:
### Lead Conversion Fails When Custom_Status__c Is Blank

**Symptom**: Lead conversion throws "REQUIRED_FIELD_MISSING" error.
**Cause**: A validation rule requires `Custom_Status__c` before conversion, but it's not on the conversion page layout.
**Workaround**: Set `Custom_Status__c` to "Qualified" before converting.
**Fix**: Add the field to the Lead conversion page layout (pending admin approval).

> Added by jsmith on 2025-01-15
-->

## Query Gotchas

<!-- Example:
### Querying Person Accounts

Person Accounts are not enabled in our org. Do not use `IsPersonAccount` filter — it will throw a field-not-found error.

> Added by jdoe on 2025-01-20
-->

## Permission Issues

<!-- Example:
### "Insufficient Access" on Custom_Report__c

Only users with the "Report Admin" permission set can access `Custom_Report__c` records.
If you get "INSUFFICIENT_ACCESS_OR_READONLY", check that the user has this permission set.

> Added by jsmith on 2025-02-01
-->

## Automation Side Effects

<!-- Document triggers, flows, or processes that cause unexpected behavior -->
<!-- Example:
### Account Update Triggers Territory Reassignment

Updating `BillingState` on Account triggers the territory assignment flow,
which may change the Account owner. Always warn users before bulk-updating
address fields.

> Added by jdoe on 2025-02-05
-->

## Environment-Specific Notes

<!-- Document differences between sandbox and production -->
<!-- Example:
### Sandbox Refresh Notes
- After refresh, all Connected App tokens are invalidated — re-auth required
- Test user emails are suffixed with `.invalid` — cannot test email sends
- External ID fields may have stale data — do not rely on them for testing

> Added by jsmith on 2025-02-10
-->
