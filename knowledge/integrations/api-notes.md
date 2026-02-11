# External Integration Notes

Document external systems that integrate with your Salesforce org.

## Connected Apps

<!-- Example:
### Marketing Automation (HubSpot)
- **Direction**: Bidirectional sync
- **Objects synced**: Lead, Contact, Campaign
- **Key fields**: `HubSpot_ID__c` (External ID on Lead/Contact)
- **Sync frequency**: Every 15 minutes
- **Gotcha**: Do not modify `HubSpot_ID__c` manually — it breaks the sync

> Added by jsmith on 2025-01-15
-->

## API Endpoints

<!-- Document custom APIs or middleware -->
<!-- Example:
### Order Management Middleware
- **System**: Custom Node.js service
- **Purpose**: Creates Opportunity + OpportunityLineItems from e-commerce orders
- **Auth**: Connected App with JWT bearer flow
- **Endpoint**: POST `/api/salesforce/orders`
- **Creates**: Opportunity, OpportunityLineItem records

> Added by jdoe on 2025-01-20
-->

## External IDs

<!-- Document external ID fields used for integrations -->
<!-- Example:
### External ID Fields
| Object | Field | Source System |
|---|---|---|
| Account | `ERP_ID__c` | SAP |
| Contact | `HubSpot_ID__c` | HubSpot |
| Product2 | `SKU__c` | E-commerce platform |

Always use upsert with these external IDs when loading data from external systems.

> Added by jsmith on 2025-02-01
-->

## Data Flow Diagrams

<!-- Document how data flows between systems -->
