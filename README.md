# Build and Start
From within /main (see Project Layout) run:
```
docker-compose up -d
```
If modifications are made effecting the images, clean the image using ```docker-compose rm``` then rerun ```docker-compose up```

# Project Layout
Project layout example required for build:
```
    /Faction
        /api
        /console
        /core
        /dotnet-agent
        /main
```
