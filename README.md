# cloud_bella_cli
[Alpha v0.2, work in progress]

>A renderfarm is great for large projects and teams but the learning curve is high for a single artist. That being said, the Linux skills learned using **cloud_bella_cli.sh** are the exact ones needed for success with **oomerfarm**. 

***cloud_bella_cli.sh***: a helper script to run bella_cli in the cloud or on a home Linux server:

These 4 options are presented in a 1980's MS-DOS style menu interface. ( really a 1970's Unix shell interface)
- upload .bsz to server
- render .bsz on server
- check bella progress
- download .png from server

```sh
=================================================
1) upload	  3) progress	    5) parseFragment  7) settings
2) render	  4) download	    6) server	      8) quit
```
# Setup for a Linux cloud server
## Basic bash/linux knowledge
- ~ ( aka tilde ) is shorthand for
    - C:/Users/harvey <sup>win</sup>
    - /Users/harvey <sup>mac</sup>
    - /home/harvey <sup>linux</sup>
    - or whatever YOUR home directory is
- can be used in bash commands to avoid typing full path
- used extensively in these docs to avoid typing full path


## Desktop/laptop prep
Open **MacOS Terminal** or **Windows bash** https://git-scm.org

Generate secret ssh private key
```sh
ssh-keygen -t ed25519
```
View and copy your public key
```sh
cat ~/.ssh/id_ed25519.pub
```

## Cloud server prep
Rent a Linux cloud server
- Any vendor will do, but for beginners I recommend https://vultr.com ( Use first month $250 credit promo )
- Under Account->SSH Keys paste your **public key** 
    - will look like this ( don't use this one)
```sh
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBtbE/BDpqNB2wL36eWLDKcu9L/7bkiZYtdRvIj2dah5 harvey@mycomputer
``````
- Add money
- Launch
    - Optimized Cloud Compute and cpu optimized  instance 
    - Choose **Alma** Linux 8.x
    - attach your ssh **public** key
    - disable **auto-backup**
    - disable **IPv6**
- After server starts, make note of assigned **ip** address

## Run cloud_bella_cli.sh on Desktop/laptop

1. save **cloud_bella_cli.sh** in the same dir as **.bsz** file(s)

2. In **MacOS Terminal** or **Windows bash**  https://git-scm.org
```sh
bash cloud_bella_cli.sh
```


## To upload .bsz file(s)
- upload more than one .bsz to queue up a series of renders
- ensure bella output name differs or else last render stomps over fist
```sh
=================================================
1) upload    3) progress  5) parseFragment  7)settings 
2) render    4) download  6) server         8) quit 

#? 1
porsche-907.bsz ring-brushed-dark-bg.bsz
1) porsche-907.bsz	     3) back
2) ring-brushed-dark-bg.bsz
#? 1
porsche-907.bsz  54%   41MB   5.6MB/s   00:06 ETA 
```

## To sequentially render uploaded .bsz file(s)

- Runs in background ( to kill a running bella_cli just terminate the server)
- Will delete .bsz after a successful or a failed render.

```sh
=================================================
1) upload    3) progress  5) parseFragment  7)settings 
2) render    4) download  6) server         8) quit
#? 2
Rendering started for: /root/porsche-907.bsz
```

## To check bella progress
- displays last 10 lines of bella_cli's output

```sh
=================================================
1) upload    3) progress  5) parseFragment  7)settings 
2) render    4) download  6) server         8) quit 
#? 3
[INFO][17:18:11] Saturn | Elapsed: 1s | Bench: 271
[INFO][17:18:11] Saturn | Elapsed: 1s | Bench: 272
[INFO][17:18:12] Saturn | Elapsed: 1s | Bench: 273
[INFO][17:18:12] Saturn | Elapsed: 2s | Bench: 274
[INFO][17:18:12] Saturn | Elapsed: 2s | Bench: 274
[INFO][17:18:12] Saturn | Elapsed: 2s | Bench: 274
[INFO][17:18:13] Saturn | Elapsed: 2s | Progress: 5.00%
[INFO][17:18:13] Saturn | Elapsed: 3s | Progress: 10.76%
[INFO][17:18:14] Saturn | Elapsed: 4s | Progress: 19.64%
[INFO][17:18:15] Saturn | Elapsed: 4s | Progress: 27.59%

=================================================
```

## To download images ( default png , use settings to switch)

```sh
=================================================
1) upload    3) progress  5) parseFragment  7)settings 
2) render    4) download  6) server         8) quit 
#? 4
porsche-907.png  100%   15KB  90.7KB/s   00:00
```

## To remove watermark 

>after these steps open a **new** bash/zsh before running cloud_bella_cli

edit/create **textfile** ~/.ssh/config 
- add this line
```sh
SendEnv BELLA_LICENSE_TEXT
```
edit/create **text** file
- ~/.zshrc (mac) 
- ~/.bashrc (win) 

Into **text** file as one line
- type <sup>export BELLA_LICENSE_TEXT="</Sup>
- paste text from bella.lic 
- end the line with <sup>"</sup>
```sh
export BELLA_LICENSE_TEXT="# Bella License
owner:     oomer
type:      FULL
seats:     1
nodes:     5
version:   1
expires:   1721874318 (Wed Jul 24 21:25:18 2024)
key:       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

## To add global parseFragment 

create **text** file ~/.ssh/config and add this line
```sh
SendEnv BELLA_PARSE_FRAGMENT
```
edit/create **text** file
- ~/.zshrc (mac) 
- ~/.bashrc (win) 
Into **text** file add your fragment
```sh
export BELLA_PARSE_FRAGMENT="camera.resolution=vec2(100,100);"
```



## Remember to terminate your servers
On vultr.com or whichever cloud vendor you chose, stopped servers **continue** to get charged hourly because they hold on to the compute resources. Please terminate or destroy your server to avoid unexpected charges.
