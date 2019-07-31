# Docker and testing

```javascript

npm run start

//or

npm run test

//make Dockerfile.dev
docker build -f Dockerfile.dev .

//might have dupe depends so delete node_modules

//so we dont need to rebuild for every code change
docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app myDockImage

//this will cause error because we dont have node_modules since we deleted
docker run -p 3000:3000 -v $(pwd):/app 05094441f975

// the -v /app/node_modules, has no : because we are
// not mapping from our machine, not to map cuz its in our container


// so essentially now, anytime container wants to access file in /app
// it should reach out to our local machine for it but not the node_modules

docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app myDockImage


// Travis CI, continuous integration service

docker build -f Dockerfile.dev .

docker run -it d254e36ebc7c npm run test

//to attach
docker exec -it test_id npm run test

//the .travis.yml changes

script:
  - docker run -e CI=true USERNAME/docker-react npm run test

```
