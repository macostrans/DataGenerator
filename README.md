Project Requirement:  
Create an api that spits out random number of data points based on given input. Ex. If I give 5 it should return 5 random data points(limit it to 200 data points per request).

Tools: Python, Fast API, Faker, AWS, Docker, docker swarm, bash, ubuntu, Anaconda.  
Plan:   
  Step 1: create python script and test fast API locally with docker  
  Step 2: Test using dockerfile/docker stack  
  step 3: create 3 small nodes in aws  
  step 4: deploy using docker swarm and ensure equal distribution of api calls across nodes  

Bonus:  
  1. Deploy healthcheck.  
  2. Try update and rollback.  
  3. Set up versioning and devops.  

Roadblocks faced in step 1:
ERROR: No matching distribution found for uvicorn==0.18.0
Unable to access the api even though I already mapped ports.
ImportError: cannot import name 'NoReturn' when I try to run uvicorn.
Could not find a version that satisfies the requirement anyio<5,>=3.4.0
Internal service error when I hit /employeeDetails/{total} because it recognizes total as string. 

Learnings and links for step1:
1. Bind your app inside Docker to 0.0.0.0, not to 127.0.0.1 address to let Docker reach the app inside container.
2. https://stackoverflow.com/questions/39525820/docker-port-forwarding-not-working.
3. Used path with parameter types(total: int) inside the def functions.
4. Use the right or latest stable versions of python images or install it yourself on top of ubuntu images.
5. Use requirments.txt file to install dependencies.
6. update pip inside images

Bonus Part 2:  
a)Adding healthcheck:  
Added the healthcheck command directly to the dockerfile and pushed the image to docker hub.

Roadblocks and learnings:  
The docker container kept failing due to missing curl command and /bin/bash since I was using alpine version.  
Instaled curl and used /bin/sh within dockerfile for healthcheck.  
Don't use -d if you want to debug.  

b) Adding SSL  
This is the hard part where I had do a lot of configuration to automate SSL for all domains. The link below explains this comprehensively:  
https://www.youtube.com/watch?v=liV3c9m_OX8  
https://docs.technotim.live/posts/traefik-portainer-ssl/  

Steps taken:  
1. Purchased the domain datadeveloperfusion.com
2. Created master node and captured it's ip
3. Created domain mapping(A record mapping) to traefik-dashboard.datadeveloperfusion.com, api.datadeveloperfusion.com and portainer.datadeveloperfusion.com. Find attached screenshot. Make sure to map only to the traefik containers.
4. Get API token or key from cloudflare with proper authorization key for automating SSL certification
5. Hosted traefik and portainer with provided docker-compose and traefik configuration.
6. Finally created the docker swarm using portainer and mapped traefik config file to a random node hosting the api. The surprisingly best part about this is you don't need to mention all the nodes in config since swarm auto balances all request across containers.

Roadblocks and learnings:  
Traefik docker compose kept restarting since I failed to map the config files properly.  
Got API authorization key error since it did not have the right authorization. Make sure your token has zone edit acccess.  
After this I got a nvalied certificate error since I failed to clear the ACME.json cache file holding the wrong SSL created in the previous docker compose failure error.  
Make sure to host traefik on only manager container.  
Don't forget to add chmod 600 to ACME file.  
Use hashed password for traefik compose file. You can find it at the end of youtube tutorial.  

ERROR: too many redirects.  
This is after fixing everything on the container side. Set the Cloudflare SSL mode to full (strict), and the redirect loop should be resolved.  
https://community.cloudflare.com/t/too-many-redirects-when-connection-proxied/209051  

ERROR: SSL VERSION OR CYPHER MISMATCH. Make sure to disable proxy on A name records within cloudflare as seen in the screenshot.  
https://community.letsencrypt.org/t/ssl-mismatch-when-using-cloudflare-proxy-traefik/52612  

Got traefik docker compose failure due to wrong indentation. Be careful while working with indentations.  
Don't forget to change host rule to your own domain.  
Learn to use portainer to manage docker services.  
When creating nodes on cloud use bash scripts to pre install docker and other requirments.  