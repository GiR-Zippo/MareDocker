vcl 4.1;

import std;
import directors;

include "backends.vcl";

sub vcl_recv {
    if (req.url ~ "/auth") {
	
		set req.backend_hint = mare_auth;
		
        # WebSocket headers
        if (req.http.Upgrade ~ "(?i)websocket") {
            set req.http.Connection = "Upgrade";
        }

        # Forward necessary headers
        set req.http.CF-CONNECTING-IP = client.ip;
        set req.http.X-Forwarded-Proto = req.proto;
        set req.http.Host = req.http.Host;

        return (pass);
    }
	elseif (req.url ~ "/files") {
		set req.backend_hint = mare_file;
		# WebSocket headers
        if (req.http.Upgrade ~ "(?i)websocket") {
            set req.http.Connection = "Upgrade";
        }

        # Forward necessary headers
        set req.http.CF-CONNECTING-IP = client.ip;
        set req.http.X-Forwarded-Proto = req.proto;
        set req.http.Host = req.http.Host;

        return (pipe);
    }
	else
    {
		set req.backend_hint = mare_server;

        # WebSocket headers
        if (req.http.Upgrade ~ "(?i)websocket") {
            set req.http.Connection = "Upgrade";
        }

        # Forward necessary headers
        set req.http.CF-CONNECTING-IP = client.ip;
        set req.http.X-Forwarded-Proto = req.proto;
        set req.http.Host = req.http.Host;

        return (pass);
    }
	

}

sub vcl_pipe {
    # Pipe is used for WebSockets
    set bereq.http.Connection = req.http.Connection;
    set bereq.http.Upgrade = req.http.Upgrade;
    return (pipe);
}

sub vcl_backend_fetch {
}

sub vcl_backend_response {
    # Avoid buffering responses (e.g. with real-time API responses)
    set beresp.do_stream = true;
}

sub vcl_deliver {
  return (deliver);
}

sub vcl_synth {
    if (resp.status == 301 || resp.status == 302) {
        set resp.http.location = resp.reason;
        set resp.reason = "Moved";
        return (deliver);
    }
}