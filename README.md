Assume we have the following standard architecture used to support an online calendar:
Calendar UI (Web browser) -> Server (REST API) -> DB

Problem: Storing repetition patterns
The calendar framework supports the following repetition patterns when creating appointments:
- Daily
- Weekly
- Every x day
- Every month
The following attributes are also relevant:
● Date of first appointment
● Date of last appointment (optional)
Furthermore it is possible to have multiple deviations from the standard pattern (e.g. appointments whose start times are
slightly different than the others or appointments that are cancelled). The deviation is still considered linked to the base
repetition pattern, so it’s possible to delete all related events.
Present a technical description of how to store and retrieve the repeating events from a database.
