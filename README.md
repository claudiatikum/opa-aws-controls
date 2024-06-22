# opa-aws-controls
This repo holds OPA controls for AWS S3 bucket

### POTENTIAL EDGE CASES
Ensure the policy correctly handles users that have multiple roles
The policy should allow access only if one of the roles is st-access-role.
An example is a user with roles ["admin", "st-access-role"] should be allowed.

Role names could be case-sensitive. Ensure consistency when naming roles.
An example is  'st-access-role' vs 'ST-ACCESS-ROLE'.

A user with roles empty or without the roles field should be denied access.
An example is a user with roles: [] or without the roles field should be denied access.

Cases should be handled where the input JSON might be malformed or missing expected fields.
An example is inputs missing the user or roles fields.


A user with an empty role list should be considered 
Example is roles: [].


### POTENTIAL BYPASS 
Users might be incorrectly assigned the st-access-role without the necessary permissions audit. Ensure there is strict role assignment policies besides OPA.

Errors in the policy configuration could lead to unintended access. Ensure thorough testing and review of the OPA policy.

Users could attempt to spoof role information if the identity provider is compromised. Ensure the Security of the identity provider and the integrity of identity data.


### LOGGING AND MONITORING

I would configure OPA to log all decisions made by the policy. This will include whether access was allowed or denied, along with the reasons.

I would integrate with External Logging Systems to send the logs to external systems like Elasticsearch, Splunk, or any cloud-native logging service like AWS CloudWatch.

I would use the external logging systems to monitor access patterns, detect anomalies, and set up alerts for suspicious activities.

### ASSUMPTIONS
All decisions both allowed and denied access need to be logged for auditing purposes.
Logs should also include detailed information about the request, such as the user ID, action, resource, and decision outcome.
Logs should be monitored to detect anomalies, such as repeated access denials or unexpected access patterns.
Alerts should be configured to notify administrators of potential security incidents.
