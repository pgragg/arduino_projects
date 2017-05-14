# arduino_projects
## destServer: 
  - A sample piece of code which allows an ESP8266 Shield connected to an Arduino UNO to send a GET request to a specified server. 
  - Create a keys.yml file like that in keys_example.yml. Add your open weather API key to get started.
  - In the example, I'm using Ngrok to simulate a production server. 
  - I've setup a Sinatra app to handle the request. To run, just 
    - ''' $ ruby server/sinatra_server.rb ''' 
