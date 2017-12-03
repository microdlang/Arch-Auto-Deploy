# aurutilsci [![Build Status](https://travis-ci.org/localnet/aurutilsci.svg?branch=master)](https://travis-ci.org/localnet/aurutilsci)

Use [Travis CI](https://travis-ci.org/localnet/aurutilsci) for building and packaging [aurutils](https://github.com/AladW/aurutils) [AUR](https://aur.archlinux.org) package and deploy it to [GitHub Releases](https://github.com/localnet/aurutilsci/releases) so it can be used as repository in [Arch Linux](https://www.archlinux.org).

## Use repository

To use as custom repository in [Arch Linux](https://www.archlinux.org), add to file `/etc/pacman.conf`:

```
[aurutilsci]
SigLevel = Optional TrustAll
Server = https://github.com/localnet/aurutilsci/releases/download/repository
```

Then on the command line:

```
pacman -Sy              # Refresh package database.
pacman -Sl aurutilsci   # Show packages in repository.
pacman -S {package}     # Install a package.
```

**NOTE:** Only one package in repository is aurutils.

## Forking repository                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                               
For build and package [aurutils](https://github.com/AladW/aurutils) [AUR](https://aur.archlinux.org) package by yourself fork this repository and enable [Travis CI](https://travis-ci.org):

  - Fork this GitHub repository.
  - Create a release for your new forked repository.
  - Generate a personal access token with scope `public_repo`.
  - Enable Travis CI for your new forked repository.
  - In Travis CI repository settings disable build pull request updates, for security.
  - In Travis CI repository settings declare two environment variables:
    - `GITHUB_TOKEN`: The previously created personal access token, disable display value.
    - `TRAVIS_TAG`: The name of your previosly created GitHub release.
  - Optionally, enable a cron job in Travis CI repository settings.
