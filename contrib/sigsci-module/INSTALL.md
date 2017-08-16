## Signal Sciences Nginx Lua Module

### Getting Started

Ensure your installed Nginx is compiled with the ngx_lua module, either using our sigsci-ngx-bundle or built to your own specification.

You can check if your nginx is built with the correct modules installed by using the check script provided we've provided in `/opt/sigsci/nginx/check_ngx_lua.sh`. You can check your Nginx as follows:

```
% /opt/sigsci/nginx/check_ngx_lua.sh /usr/sbin/nginx

Checking nginx binary /opt/sigsci-nginx/sbin/nginx
 * OK: ngx_lua is built in
 * OK: nginx is dynamically linked against luajit
Congratulations, your Nginx is ready for Signal Sciences!
```

1. Fetch the sigsci-nginx-lua module package.

    |Distribution|Package URL|
    |------------|-----------|
    |CentOS EL6  |`https://dl.signalsciences.net/nginx-lua/sigsci-nginx-lua-module-latest.el6-1.noarch.rpm`|
    |CentOS EL7  |`https://dl.signalsciences.net/nginx-lua/sigsci-nginx-lua-module-latest.el7-1.noarch.rpm`|
    |Ubuntu      |`https://dl.signalsciences.net/nginx-lua/sigsci-nginx-lua-module_latest_all.deb`|
    
2. Install the package.

    |Distribution| |
    |------------|----|
    |CentOS      | `rpm -i ./sigsci-nginx-lua-module_latest.rpm`|
    |Ubuntu      | `dpkg -i ./sigsci-nginx-lua-module_latest.deb`|
    
    This will install the configuration snippets and lua module code in `/opt/sigsci/nginx`
    

3. Enable the module in your Nginx configuration

   To enable the Signal Sciences module you'll need to add the following line inside the `http` context of your configuration file:

   ```
   include "/opt/sigsci/nginx/sigsci.conf";
   ```


4. Update Signal Sciences agent configuration:

   In your `/etc/sigsci/agent.conf` configuration file, you'll need to add the following configuration line to enable the RPC listener for the module:
   
   ```
   rpc-address=unix:/tmp/sigsci-lua
   ```
   
5. Finally restart the sigsci agent and then restart nginx and you should be good to go.


### Advanced Configuration (optional)

By default, the configuration detailed above enables the Signal Sciences module for all servers defined in your Nginx configuration globally. If you however would like to selectively enable or disable the Signal Sciences module you can use the following split configuration instead.

1. Firstly in your `http` context add the following configuration line:

   ```
   include "/opt/sigsci/nginx/sigsci_init.conf";
   ```

2. If you'd like to enable the module only for specific servers include the following line inside each `server ` you'd like monitored.

   ```
   include "/opt/sigsci/nginx/sigsci_module.conf";
   ```
