backend mare_auth { # Define one backend
  .host = "172.28.0.4";   # IP or Hostname of backend
  .port = "8080";         # Port Apache or whatever is listening
  .max_connections = 300; # That's it

  .first_byte_timeout     = 300s;   # How long to wait before we receive a first byte from our backend?
  .connect_timeout        = 5s;     # How long to wait for a backend connection?
  .between_bytes_timeout  = 2s;     # How long to wait between bytes received from our backend?
}

backend mare_server { # Define one backend
  .host = "172.28.0.3";   # IP or Hostname of backend
  .port = "6000";         # Port Apache or whatever is listening
  .max_connections = 300; # That's it

  .first_byte_timeout     = 300s;   # How long to wait before we receive a first byte from our backend?
  .connect_timeout        = 5s;     # How long to wait for a backend connection?
  .between_bytes_timeout  = 2s;     # How long to wait between bytes received from our backend?
}

backend mare_file { # Define one backend
  .host = "172.28.0.5";   # IP or Hostname of backend
  .port = "6200";         # Port Apache or whatever is listening
  .max_connections = 300; # That's it

  .first_byte_timeout     = 300s;   # How long to wait before we receive a first byte from our backend?
  .connect_timeout        = 5s;     # How long to wait for a backend connection?
  .between_bytes_timeout  = 2s;     # How long to wait between bytes received from our backend?
}