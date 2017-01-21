Update-MOTD
===========

This repository provides some basic scripts I am using for generating a nice & informative /etc/motd.
I use this on my personal arch server, feel free to adapt it to your own needs & servers.

## Screenshot:
![Screenshot of the cat](https://github.com/floffel03/systemd_motd-update/blob/master/screenshot.png?raw=true)


## Usage
See the file tree below and push the files into the right directory.

## Files
```
├── etc                                                                                     -> Your /etc/. Yep, u'll obviously need a *nix
│   ├── history-motd                                                                        -> Folder for your history files. They should be named like theire date of creation
│   │   ├── 20.01.2017                                                                      -> Just a sample of a history log I created at 20.01.2017 -> You can safely delete it
│   │   └── 21.01.2017                                                                      -> Just a sample of a history log I created at 21.01.2017 -> You can sadly delete it
│   ├── systemd
│   │   └── system
│   │       └── multi-user.target.wants
│   │           ├── update-motd.service -> /usr/lib/systemd/system/update-motd.service      -> will be generated for you, as soon as you fire up a "sysctl enable updatemotd.service"
│   │           └── update-motd.timer -> /usr/lib/systemd/system/update-motd.timer          -> will be generated for you, as soon as you fire up a "sysctl enable updatemotd.service"
│   └── update-mot.d                                                                        -> Scripts for updating motd are living in here
│       ├── 10-header                                                                       -> my sample header file for the motd. It's still kinda messy.. So mby you should write your own
│       ├── 20-history                                                                      -> loads the history from /etc/history-motd/* into motd
│       └── 30-notes                                                                        -> loads notes from /root/notes.txt into motd
├── README.md                                                                               -> This file. NEVER delete it in production use. jk.
└── usr
    ├── bin
    │   └── update-motd                                                                     -> This is THE file. It'll be called from system.d and updates your motd
    └── lib
        └── systemd
            └── system
                ├── update-motd.service                                                     -> This is the system.d service file. For more Information see [TODO]
                └── update-motd.timer                                                       -> This is the system.d timer file. How often motd will be generated? You can adjust the timing
```
