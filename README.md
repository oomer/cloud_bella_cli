# cloud_bella_cli
[Alpha v0.1, work in progress]
- [TODO] use BELLA_LICENSE_TXT in ~/.ssh/config
- [TODO] support more than .png files

A renderfarm is great for large projects and teams but the learning curve is high for a single artist. That being said, the Linux skills learned using cloud_bella_cli.sh are the exact ones needed for success with oomerfarm. 

***cloud_bella_cli.sh***: a helper script to run bella_cli in the cloud or on a home Linux server:

These 4 options are presented in a 1980's MS-DOS style menu interface. ( really a 1970's Unix shell interface)
- upload .bsz to server
- render .bsz on server
- check bella progress
- download .png from server

```sh
=================================================
1) upload    3) progress  5) set_user  7) set_port
2) render    4) download  6) set_ip    8) quit
```
# Setup for a Linux cloud server
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
- Launch a Optimized Cloud Compute instance 
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
```sh
=================================================
1) upload    3) progress  5) set_user  7) set_port
2) render    4) download  6) set_ip    8) quit
#? 1
porsche-907.bsz ring-brushed-dark-bg.bsz
1) porsche-907.bsz	     3) back
2) ring-brushed-dark-bg.bsz
#? 1
porsche-907.bsz  54%   41MB   5.6MB/s   00:06 ETA 
```

## To render cloud .bsz file(s)
```sh
=================================================
1) upload    3) progress  5) set_user  7) set_port
2) render    4) download  6) set_ip    8) quit
#? 2
Rendering started for: /root/porsche-907.bszi
```

## To check bella progress

```sh
=================================================
1) upload    3) progress  5) set_user  7) set_port
2) render    4) download  6) set_ip    8) quit
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

## To download all cloud .png(s)

```sh
=================================================
1) upload    3) progress  5) set_user  7) set_port
2) render    4) download  6) set_ip    8) quit
#? 4
porsche-907.png  100%   15KB  90.7KB/s   00:00
```

## Remember to terminate your servers
On vultr.com stopped servers continue to get charged hourly because they hold on to the compute resources. Please terminate or destroy your server to avoid unexpected charges.
