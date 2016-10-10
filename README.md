Couchpotato server running within Docker instance

To run:
docker run -d -p 5050:5050 -v <Persistent config directory>:/opt/config -v <Persistent downloads directory>:/opt/downloads -t couchpotato
