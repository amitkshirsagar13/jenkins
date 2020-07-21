### Deploy On Poling App with UI

 - redis:alpine (Storing Cache)
 - postgres:9.4 (Database)
 - dockersamples/examplevotingapp_vote:before (Frontend UI Users/Voters)
 - dockersamples/examplevotingapp_result:before (Frontend UI Admin)
 - dockersamples/examplevotingapp_worker (Backend Process)


Create Application Setup with above images:
To run Docker Compose/Stack.
Frontend UI Users/Voters:
  Port: 8090
  Hostname: voter-ui-server

Frontend UI Admin:
  Port: 9090
  Hostname: results-ui-server

Cache:
  Port: 6379

Database:
  user: sampleuser
  pass: Admin#123
  /tmp/voter-db (host-machine)