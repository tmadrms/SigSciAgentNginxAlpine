# NGINX Module Release Notes

## 1.1.7 2016-12-12

* Disable debug log by default.

## 1.1.6 2016-12-09

* Cleanup log_debug output.

## 1.1.5 2016-11-30

* Cleanup network error logging.
* Add `log_debug` option to aid in debugging.
* Detect and warn for non-luajit installs due to recent compatibility issues.

## 1.1.4 2016-09-01

* Do not exit if nginx returns the HTTP method as nil

## 1.1.3 2016-07-26

* Correct version number reported by module

## 1.1.2 2016-07-20

* Adds new download option at https://dl.signalsciences.net/sigsci-module-nginx/sigsci-module-nginx_latest.tar.gz 

## 1.1.1 2016-07-14

* Support for Ubuntu 16.04

## 1.1.0 2016-07-13

* Changes default socket to /var/run/sigsci.sock
  This allows systemd to work without reconfiguration.
* Allows XML mime types to be passed through to Agent.
  This allows the Agent to inspect XML documents.
* removes header filtering, as that is now down in the agent.
  This allows custom rules and other actions on cookie data.
* Updates https://github.com/fperrad/lua-MessagePack/ to latest
* Fixes nginx validator script.

## 1.0.0+428 2016-03-16

* Add license information to packages
* Fix version reporting bug

## 1.0.0+424 2016-03-15

* Cleanup some error messages surrounding timeouts.
* Fix bug reading agent responses when `-rpc-version=1` is used.
* Build additional package formats

## 1.0.0+417 2016-03-07

* Fix bug with version reporting in dashboard

## 1.0.0+416 2016-02-26

* Added backward compatibility support for using the agent RPCv1 protocol
  (e.g., with `-rpc-version=1`).

## 1.0.0+411 2016-02-17

* Originally HTTP methods that were inspected where explicitly listed (whitelisted, e.g. "GET",
  "POST"). The logic is now inverted to allow all methods not on an ignored list (blacklisted,
  e.g. "OPTIONS", "CONNECT"). This allows for the detection of invalid or malicious HTTP requests.

## 1.0.0+408 2016-02-03

* Packaging fixes

## 1.0.0+407 2016-01-27

* Add support for inspecting HEAD requests
* Return faster if post request has an invalid method

## 1.0.0+388 2015-11-10

* Made network and internal error logging configurable, with network
  error logging off by default.  This will help prevent flooding
  web server logs with messages if the agent is off or not running.
* Allow "subrequest processed" used in certain configurations of
  nginx.

## 1.0.0+378 2015-10-07

* Improved error handling and standardized error message format.

## 1.0.0+369 2015-09-15

* Optionally allow a site access key to be specified in `prerequest` and
  `postrequest` functions.

## 1.0.0+363 2015-08-24

* Fix issue of missing server response codes introduced by 361.

## 1.0.0+361 2015-08-17

This is a maintenance release with general improvements.

* On startup, send a `notice` message in the error log describing the
  components used in the module.
* Upgrade pure-Lua MessagePack to 0.3.3
  (https://github.com/fperrad/lua-MessagePack) which contains minor
  performance improvements and allows use of various Lua tool chains.
* Allow module to run using plain Lua (not LuaJIT).  We strongly
  recommend LuaJit as using plain Lua may have severe performance
  issues.  However this does allow options for very low volume servers
  and aids in debugging.
* Ensure response time value is non-negative.  On machines lacking a
  monotonic clock and/or clock drift, the value can occasionally go
  negative.
* Minor performance improvements and API standardization

## 1.0.0+346 2015-07-31

* Send Scheme information to agent (i.e. `http` or `https`)
* Send TLS (SSL) protocol and cipher suite information to agent.
  Upgrade agent to at least 1.8.3385 for best results.

## 1.0.0+344 2015-07-21

* Improved clarity when nginx is misconfigured.

## 1.0.0+343 2015-07-13

* Enable setting of request headers from Agent response.  Requires
  Agent 1.8.3186 and greater.
* Adds `X-SigSci-RequestID` and `X-SigSci-AgentResponse` request
  headers, allowing integration with other logging systems.
* Fix "double signal" issue first noticed in 1.0.0+320

## 1.0.0+327 2015-07-07

* Compatibility fix to support nginx version 1.0.15

## 1.0.0+322 2015-07-06

* Support and inspect HTTP `PATCH` method

## 1.0.0+320 2015-06-14

* Fixes issues where the Signal Sciences dashboard would show a
  incorrect "Agent Response" of 0.  For best results, upgrade Agent to
  at least 1.8.2718

Known Issues (fixed in 1.0.0+343)

* Requesting a static file, or a missing file, that results with a
  custom error page may result in "double signal" on the dashboard
  (i.e. one request generates two entries).  This is due to a bug(?)
  in the nginx state machine with custom error pages.  We are actively
  working to find a solution.

## 1.0.0+315 2015-06-11

* Minor update to bring module up to latest API specification to
  enable future features.

